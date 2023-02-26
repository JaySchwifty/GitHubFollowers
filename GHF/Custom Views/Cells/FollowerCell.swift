//
//  FollowerCell.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/20/23.
//

import UIKit

class FollowerCell: UICollectionViewCell {
   
   static let reuseID = "FollowerCell"
   let avatarIV = GFAvatarImageView(frame: .zero)
   let usernameLbl = GFTitleLabel(textAlignment: .center, fontSize: 16)
   let padding: CGFloat = 8
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      config()
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   func set(follower: Follower) {
      usernameLbl.text = follower.login
      avatarIV.downloadImage(from: follower.avatarUrl)
   }
   
   
   private func config() {
      addSubview(avatarIV)
      addSubview(usernameLbl)
      
      NSLayoutConstraint.activate([
         avatarIV.topAnchor.constraint(equalTo: topAnchor, constant: padding),
         avatarIV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
         avatarIV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
         avatarIV.heightAnchor.constraint(equalTo: avatarIV.widthAnchor),
         
         usernameLbl.topAnchor.constraint(equalTo: avatarIV.bottomAnchor, constant: 12),
         usernameLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
         usernameLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
         usernameLbl.heightAnchor.constraint(equalToConstant: 20),
      ])
   }
   
   
}
