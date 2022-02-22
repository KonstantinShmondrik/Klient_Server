//
//  FriendsTableViewCell.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 06.01.2022.
//

import UIKit


class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var namesFriend: UILabel! {
        didSet {
            namesFriend.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    @IBOutlet weak var friendsLogoImage: UIImageView! {
        didSet {
            friendsLogoImage.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    @IBOutlet weak var friendsLogoView: UIView!{
        didSet {
            friendsLogoView.translatesAutoresizingMaskIntoConstraints = false
            
            self.friendsLogoView.layer.borderColor = UIColor.gray.cgColor
            self.friendsLogoView.layer.borderWidth = 0.5
            self.friendsLogoView.clipsToBounds = true
            self.friendsLogoView.layer.cornerRadius = self.friendsLogoView.frame.width / 2
            self.friendsLogoView.layer.shadowColor = UIColor.black.cgColor
            self.friendsLogoView.layer.shadowRadius = 4
            self.friendsLogoView.layer.shadowOffset = .zero
            self.friendsLogoView.layer.shadowOpacity = 0.7
            self.friendsLogoView.backgroundColor = .clear
        }
    }
    
    let instets: CGFloat = 10.0
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        namesFriendFrame()
        iconeFrame()
    }
    
    //    MARK: - расчитываем размер текста
    func getLabelSize(text: String, font: UIFont) -> CGSize{
        let maxWidth = bounds.width - instets * 2
        let textBlock = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)
        let rect = text.boundingRect(with: textBlock,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font: font],
                                     context: nil)
        let width = Double(rect.size.width)
        let hight = Double(rect.size.height)
        let size = CGSize(width: ceil(width), height: ceil(hight))
        return size
    }
    
    //    MARK: - верстка UILabel (namesFriend)
    func namesFriendFrame() {
        let namesFriendSize = getLabelSize(text: namesFriend.text ?? "", font: namesFriend.font)
        let namesFriendY = (bounds.height - namesFriendSize.height) / 2
        let namesFriendOrigin = CGPoint(x: (instets * 2 + 50),
                                        y: namesFriendY)
        
        namesFriend.frame = CGRect(origin: namesFriendOrigin, size: namesFriendSize)
    }
    
    // MARK: - Размер иконки
    func iconeFrame() {
        let iconeSideLigth: CGFloat = 50
        let iconeSize = CGSize(width: iconeSideLigth, height: iconeSideLigth)
        let iconeOrigin = CGPoint(x: instets,
                                 y: bounds.midY - iconeSideLigth / 2)
        friendsLogoImage.frame = CGRect(origin: iconeOrigin, size: iconeSize)
        friendsLogoView.frame = CGRect(origin: iconeOrigin, size: iconeSize)
    }
    
//    MARK: - установка текста в надпись
    func setNamesFriend(text: String){
        namesFriend.text = text
        namesFriendFrame()
    }
    
    
    
}
