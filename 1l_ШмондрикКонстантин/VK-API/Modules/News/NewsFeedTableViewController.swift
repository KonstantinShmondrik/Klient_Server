//
//  NewsFeedTableViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//

import UIKit
import SDWebImage


enum PostCellTipe: Int, CaseIterable {
    case autor = 0
    case text
    case photo
    case likeCount
}

class NewsFeedTableViewController: UITableViewController {
    
//    //данные заглушка потом будут руальные данные
//    private var news = [
//        NewsFeedPlug(newsText: "Случайно убила жениха благодаря демону по имени Люцик, который напоил меня",
//                     newsPhoto: "01",
//                     user: Users(name: "Тиабини", logo: "Tiabiny"),dateOfPublication: "01.01.2022"),
//        NewsFeedPlug(newsText: "hhhhhhhhhhh",
//                     newsPhoto: "02",
//                     user: Users(name: "Люцик", logo: "Lucy"), dateOfPublication: "02.02.2022"),
//        NewsFeedPlug(newsText: nil,
//                     newsPhoto: "03",
//                     user: Users(name: "Люцик", logo: "Lucy"), dateOfPublication: "02.02.2022"),
//        NewsFeedPlug(newsText: "Hello",
//                     newsPhoto: nil,
//                     user: Users(name: "Уна", logo: "Una"), dateOfPublication: "02.02.2022")
//    ]
    
    private var newsFeedAPI = NewsFeedAPI()
    private var newsFeed1 = [NewsFeed]()
    private var newsFeed = NewsFeed(response:  .init(items: [], groups: [], profiles: []))
//    private var newsFeed = NewsFeed()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsFeedAPI.getNewsFeed {[weak self] newsFeed in
           
            guard let self = self else {return}
            self.newsFeed = newsFeed! // как сделать безопасным, что вывести в defoult?
    //        self.newsFeed = newsFeed?.response.items as! [NewsFeed]
    //        self.newsFeed = newsFeed?.response.groups as! [NewsFeed]
    //        self.newsFeed = newsFeed?.response.profiles as! [NewsFeed]
            
            self.tableView.reloadData()
//            print(newsFeed)
        }
        
    
        
        
//        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return newsFeed.response.items.count// не уверен, что это именно то количество
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PostCellTipe.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let item = newsFeed.response.items[indexPath.section]
        let profile = newsFeed.response.profiles[indexPath.section] // ломается при прокрутке вниз Thread 1: Fatal error: Index out of range
        let group = newsFeed.response.groups[indexPath.section]
        let postCellTipe = PostCellTipe(rawValue: indexPath.row)
        
        switch postCellTipe {
       
        case .autor:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AutorOfFeedCell", for: indexPath) as?  AutorOfFeedTableViewCell else {return UITableViewCell()}
            if item.sourceID > 0 {
            
            cell.config(authorName: "\(profile.firstName ?? "") \(profile.lastName ?? "")",
                        autorPhoto: profile.photo100 ?? "",
                        dateOfPublication: Double(item.date))
            } else {
                cell.config(authorName: "\(group.name ?? ""))",
                            autorPhoto: group.photo50 ?? "",
                            dateOfPublication: Double(item.date))
            }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
            
        case .text:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextOfFeedCell", for: indexPath) as? TextOfFeedTableViewCell else {return UITableViewCell()}
            cell.config(textOfFeed: item.text ?? "")
            cell.separatorInset = UIEdgeInsets(top: 0,
                                               left: 0,
                                               bottom: 0,
                                               right: .greatestFiniteMagnitude)
            return cell

        case .photo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoOfFeedCell", for: indexPath) as? PhotoOfFeedTableViewCell else {return UITableViewCell()}
            cell.config(photoOfFeed: item.attachments?.last?.photo?.sizes?.last?.url ?? "")
//            item.photos?.items?[0].sizes?.last?.url - может так? но так фото не отображается
//            cell.config(photoOfFeed: item.photos?.items?.last?.sizes?.last?.url ?? "") // выдает ошибку: Value of type '[PhotosItem]' has no member 'sizes'
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell

        case .likeCount:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LikeCountCell", for: indexPath) as? LikeCountTableViewCell else {return UITableViewCell()}
            cell.config(LikeCount: Int.random(in: 0...100),
                        commentCount: Int.random(in: 0...100),
                        shareCount: Int.random(in: 0...100),
                        viewsCount: Int.random(in: 0...100))
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

