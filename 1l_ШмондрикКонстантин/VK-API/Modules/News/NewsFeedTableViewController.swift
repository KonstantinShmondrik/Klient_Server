//
//  NewsFeedTableViewController.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//

import UIKit


enum PostCellTipe: Int, CaseIterable {
    case autor = 0
    case text
    case photo
    case likeCount
}

class NewsFeedTableViewController: UITableViewController {
    
    //данные заглушка потом будут руальные данные
    private var news = [
        NewsFeedPlug(newsText: "Случайно убила жениха благодаря демону по имени Люцик, который напоил меня",
                     newsPhoto: "01",
                     user: Users(name: "Тиабини", logo: "Tiabiny"),dateOfPublication: "01.01.2022"),
        NewsFeedPlug(newsText: "hhhhhhhhhhh",
                     newsPhoto: "02",
                     user: Users(name: "Люцик", logo: "Lucy"), dateOfPublication: "02.02.2022"),
        NewsFeedPlug(newsText: nil,
                     newsPhoto: "03",
                     user: Users(name: "Люцик", logo: "Lucy"), dateOfPublication: "02.02.2022"),
        NewsFeedPlug(newsText: "Hello",
                     newsPhoto: nil,
                     user: Users(name: "Уна", logo: "Una"), dateOfPublication: "02.02.2022")
    ]
    
    private var newsFeedAPI = NewsFeedAPI()
    private var newsFeed: [NewsFeed] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        newsFeedAPI.getNewsFeed2 { [weak self] newsFeed in
            guard let self = self else {return}
            self.newsFeed = newsFeed
            self.tableView.reloadData()
        }
        
        
        newsFeedAPI.getNewsFeed { [weak self] newsFeed in
            guard let self = self else {return}
            self.newsFeed = newsFeed
            self.tableView.reloadData()
        }
        
        
        
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PostCellTipe.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = news[indexPath.section]
        let postCellTipe = PostCellTipe(rawValue: indexPath.row)
        
        switch postCellTipe {
        case .autor:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AutorOfFeedCell", for: indexPath) as?  AutorOfFeedTableViewCell else {return UITableViewCell()}
            cell.config(authorName: item.user.name, autorPhoto: item.user.logo, dateOfPublication: item.dateOfPublication)
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        case .text:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextOfFeedCell", for: indexPath) as? TextOfFeedTableViewCell else {return UITableViewCell()}
            cell.config(textOfFeed: item.newsText ?? "")
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
            
        case .photo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoOfFeedCell", for: indexPath) as? PhotoOfFeedTableViewCell else {return UITableViewCell()}
            cell.config(photoOfFeed: item.newsPhoto ?? "")
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        case .likeCount:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LikeCountCell", for: indexPath) as? LikeCountTableViewCell else {return UITableViewCell()}
            cell.config(LikeCount: Int.random(in: 0...100), commentCount: Int.random(in: 0...100), shareCount: Int.random(in: 0...100), viewsCount: Int.random(in: 0...100))
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

