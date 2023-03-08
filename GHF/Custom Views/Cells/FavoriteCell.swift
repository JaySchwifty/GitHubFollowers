//
//  FavoriteCell.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/2/23.
//

import UIKit

class FavoriteCell: UITableViewCell {

   static let reuseID   = "FavoriteCell"
   let avatarIV         = GFAvatarImageView(frame: .zero)
   let usernameLbl      = GFTitleLabel(textAlignment: .left, fontSize: 26)
   
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      config()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   func set(favorite: Follower) {
      usernameLbl.text = favorite.login
      avatarIV.downloadImage(fromURL: favorite.avatarUrl)
   }
   
   
   private func config() {
      addSubviews(avatarIV, usernameLbl)
      
      let padding: CGFloat    = 12
      accessoryType           = .disclosureIndicator
      
      NSLayoutConstraint.activate([
         avatarIV.centerYAnchor.constraint(equalTo: centerYAnchor),
         avatarIV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
         avatarIV.widthAnchor.constraint(equalToConstant: 60),
         avatarIV.heightAnchor.constraint(equalToConstant: 60),
         
         usernameLbl.centerYAnchor.constraint(equalTo: centerYAnchor),
         usernameLbl.leadingAnchor.constraint(equalTo: avatarIV.trailingAnchor, constant: 24),
         usernameLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
         usernameLbl.heightAnchor.constraint(equalToConstant: 40)
      ])
   }
    
}
