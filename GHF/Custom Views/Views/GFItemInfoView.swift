//
//  GFItemInfoView.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/1/23.
//

import UIKit

enum ItemInfoType {
   case repos, gits, followers, following
}

class GFItemInfoView: UIView {
   
   let symbolIV = UIImageView()
   let titleLbl = GFTitleLabel(textAlignment: .left, fontSize: 14)
   let countLbl = GFTitleLabel(textAlignment: .center, fontSize: 14)
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      config()
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   private func config() {
      addSubviews(symbolIV, titleLbl, countLbl)
      
      symbolIV.tintColor      = .label
      symbolIV.contentMode    = .scaleAspectFill
      symbolIV.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         symbolIV.topAnchor.constraint(equalTo: topAnchor),
         symbolIV.leadingAnchor.constraint(equalTo: leadingAnchor),
         symbolIV.widthAnchor.constraint(equalToConstant: 20),
         symbolIV.heightAnchor.constraint(equalToConstant: 20),
         
         titleLbl.centerYAnchor.constraint(equalTo: symbolIV.centerYAnchor),
         titleLbl.leadingAnchor.constraint(equalTo: symbolIV.trailingAnchor, constant: 12),
         titleLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
         titleLbl.heightAnchor.constraint(equalToConstant: 18),
         
         countLbl.topAnchor.constraint(equalTo: symbolIV.bottomAnchor, constant: 4),
         countLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
         countLbl.trailingAnchor.constraint(equalTo: trailingAnchor),
         countLbl.heightAnchor.constraint(equalToConstant: 18)
      ])
   }
   
   
   func set(itemInfoType: ItemInfoType, withCount count: Int) {
      switch itemInfoType {
      case .repos:
         symbolIV.image    = SFSymbols.repos
         titleLbl.text     = "Public Repos"
         
      case .gits:
         symbolIV.image    = SFSymbols.gists
         titleLbl.text     = "Public Gists"
         
      case .followers:
         symbolIV.image    = SFSymbols.followers
         titleLbl.text     = "Followers"
         
      case .following:
         symbolIV.image    = SFSymbols.following
         titleLbl.text     = "Following"
      }
      
      countLbl.text = String(count)
   }
   
}
