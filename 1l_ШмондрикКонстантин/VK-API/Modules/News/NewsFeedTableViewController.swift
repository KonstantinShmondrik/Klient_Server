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
    
    
    private var newsFeedAPI = NewsFeedAPI()
    private var newsFeed1 = [NewsFeed]()
    private var newsFeed = NewsFeed(response:  .init(items: [], groups: [], profiles: [], nextFrom: ""))
    
    
    var isLoading = false
    
    //    private var newsFeed = NewsFeed()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        refreshNews()
        setupRefreshControl()
        
        tableView.reloadData()
    }
    //MARK: - Вычисляем высоту ячейки с фото
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let postCellTipe = PostCellTipe(rawValue: indexPath.row)
        
        switch postCellTipe {
            
        case .photo:
            
            let tableWidth = tableView.bounds.width
            let newsWidth = CGFloat(self.newsFeed.response.items[indexPath.section].attachments?.last?.photo?.sizes?.last?.width ?? 1)
            let newsHeight = CGFloat(self.newsFeed.response.items[indexPath.section].attachments?.last?.photo?.sizes?.last?.height ?? 0)
            let cellHeight = tableWidth * newsHeight / newsWidth
            
            return cellHeight
            
        default:
            // Для всех остальных ячеек оставляем автоматически определяемый размер
            return UITableView.automaticDimension
            
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return newsFeed.response.items.count
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PostCellTipe.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = newsFeed.response.items[indexPath.section]
        let profile = newsFeed.response.profiles
        let group = newsFeed.response.groups
        let postCellTipe = PostCellTipe(rawValue: indexPath.row)
        
        switch postCellTipe {
            
        case .autor:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AutorOfFeedTableViewCell.reuseID, for: indexPath) as?  AutorOfFeedTableViewCell else {return UITableViewCell()}
            
            switch item.sourceID.signum() {
                
            case 1: // Пост пользователя
                let currentFeedItemProfile = profile.filter{ $0.id == item.sourceID }[0]
                cell.config(authorName: "\(currentFeedItemProfile.firstName ?? "") \(currentFeedItemProfile.lastName ?? "")",
                            autorPhoto: currentFeedItemProfile.photo100 ?? "",
                            dateOfPublication: Double(item.date))
                
            case -1: // Пост группы
                let currentFeedItemGroup = group.filter{ $0.id == abs(item.sourceID) }[0]
                cell.config(authorName: "\(currentFeedItemGroup.name ?? ""))",
                            autorPhoto: currentFeedItemGroup.photo50 ?? "",
                            dateOfPublication: Double(item.date))
                
            default: break
            }
            cell.separatorInset = UIEdgeInsets(top: 0,
                                               left: 0,
                                               bottom: 0,
                                               right: .greatestFiniteMagnitude)
            return cell
            
        case .text:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextOfFeedTableViewCell.reuseID, for: indexPath) as? TextOfFeedTableViewCell else {return UITableViewCell()}
            cell.config(textOfFeed: item.text ?? "")
            cell.separatorInset = UIEdgeInsets(top: 0,
                                               left: 0,
                                               bottom: 0,
                                               right: .greatestFiniteMagnitude)
            return cell
            
        case .photo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoOfFeedTableViewCell.reuseID, for: indexPath) as? PhotoOfFeedTableViewCell else {return UITableViewCell()}
            cell.config(photoOfFeed: item.attachments?.last?.photo?.sizes?.last?.url ?? "")
            cell.separatorInset = UIEdgeInsets(top: 0,
                                               left: 0,
                                               bottom: 0,
                                               right: .greatestFiniteMagnitude)
            return cell
            
        case .likeCount:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LikeCountTableViewCell.reuseID, for: indexPath) as? LikeCountTableViewCell else {return UITableViewCell()}
            cell.config(LikeCount: item.likes?.count ?? 0,
                        commentCount: item.comments?.count ?? 0,
                        shareCount: item.reposts?.count ?? 0,
                        viewsCount: item.views?.count ?? 0)
           
            cell.separatorInset = UIEdgeInsets(top: 0,
                                               left: 0,
                                               bottom: 0,
                                               right: .greatestFiniteMagnitude)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    //MARK: - Функция настройки контроллера
    fileprivate func setupRefreshControl() {
        
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl?.tintColor = .gray
        refreshControl?.addTarget(self, action: #selector(refreshNews), for: .valueChanged)
    }
    
    @objc func refreshNews(){
        
        self.refreshControl?.beginRefreshing()
        
        newsFeedAPI.getNewsFeed {[weak self] newsFeed in
            
            guard let self = self else {return}
            
            self.newsFeed = newsFeed! // как сделать безопасным, что вывести в defoult?
            //        self.newsFeed = newsFeed?.response.items as! [NewsFeed]
            //        self.newsFeed = newsFeed?.response.groups as! [NewsFeed]
            //        self.newsFeed = newsFeed?.response.profiles as! [NewsFeed]
            
            self.tableView.reloadData()
            //            print(newsFeed)
            print("ЗНАЧЕНИЕ NextFrom\(String(describing: newsFeed?.response.nextFrom))")
            
        }
        
        self.refreshControl?.endRefreshing()
    }
    
    
}

