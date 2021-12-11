//
//  MyNewsTableViewController.swift
//  1l_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 21.11.2021.
//

import UIKit

class MyNewsTableViewController: UITableViewController {
   
    
    
    private var news = [
        NewsPage(newsText: "Случайно убила жениха благодаря демону по имени Люцик, который напоил меня",
                 newsPhoto: "01",
                 user: Users(name: "Тиабини", logo: "Tiabiny")),
        NewsPage(newsText: "hhhhhhhhhhh",
                 newsPhoto: "02",
                 user: Users(name: "Люцик", logo: "Lucy"))
                         ]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

       config()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return news.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyNewsTableViewCell", for: indexPath) as? MyNewsTableViewCell else {return UITableViewCell() }

        let new = self.news[indexPath.row] // ОШИБКА в этом месте исправить передачу данных
//        cell.configurate(newsText: new.newsText, newsPhoto: new.newsPhoto)
        cell.newsText.text = new.newsText
        cell.newsPhoto.image = UIImage(named: new.newsPhoto)

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyNewsTableViewCell", for: indexPath) as! MyNewsTableViewCell
//
//        return cell.newsPhoto.frame.height
//    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = Bundle.main.loadNibNamed("NewsFooterView", owner: self, options: nil)?.first as? NewsFooterView else{return UITableViewCell()}
        return footer
        
       
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = Bundle.main.loadNibNamed("NewsHeaderViewCell", owner: self, options: nil)?.first as? NewsHeaderViewCell else {return UITableViewCell()}
        
        header.usersLogo.image = UIImage(named: news[section].user.logo)

        header.usersName.text! = news[section].user.name
        
        return header
    }
    
    
    
    private func config() {
        
        tableView.register(UINib(nibName: "NewsFooterView", bundle: nil), forCellReuseIdentifier: "NewsCell")
        tableView.register(UINib(nibName: "NewsHeaderViewCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
       
        
        tableView.reloadData()
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
