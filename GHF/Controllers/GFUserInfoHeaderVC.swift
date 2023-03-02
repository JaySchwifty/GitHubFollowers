//
//  GFUserInfoHeaderVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/28/23.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
   
   let avatarIV = GFAvatarImageView(frame: .zero)
   let usernameLbl = GFTitleLabel(textAlignment: .left, fontSize: 34)
   let nameLbl = GFSecondaryTitleLabel(fontSize: 18)
   let locationIV = UIImageView()
   let locationLbl = GFSecondaryTitleLabel(fontSize: 18)
   let bioLbl = GFBodyLabel(textAlignment: .left)
   
   var user: User!
   
   init(user: User) {
      super.init(nibName: nil, bundle: nil)
      self.user = user
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      addSubviews()
      layoutUI()
      configUIElements()
   }
   
   
   func configUIElements() {
      avatarIV.downloadImage(from: user.avatarUrl)
      usernameLbl.text = user.login
      nameLbl.text = user.name ?? ""
      locationLbl.text = user.location ?? "No Location"
      bioLbl.text = user.bio ?? "No bio"
      bioLbl.numberOfLines = 3
      
      locationIV.image = UIImage(systemName: SFSymbols.location)
      locationIV.tintColor = .secondaryLabel
   }
   
   
   func addSubviews() {
      view.addSubview(avatarIV)
      view.addSubview(usernameLbl)
      view.addSubview(nameLbl)
      view.addSubview(locationIV)
      view.addSubview(locationLbl)
      view.addSubview(bioLbl)
   }
   
   
   func layoutUI() {
      let padding: CGFloat = 20
      let textImagePadding: CGFloat = 12
      locationIV.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         avatarIV.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
         avatarIV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         avatarIV.widthAnchor.constraint(equalToConstant: 90),
         avatarIV.heightAnchor.constraint(equalToConstant: 90),
         
         usernameLbl.topAnchor.constraint(equalTo: avatarIV.topAnchor),
         usernameLbl.leadingAnchor.constraint(equalTo: avatarIV.trailingAnchor, constant: textImagePadding),
         usernameLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         usernameLbl.heightAnchor.constraint(equalToConstant: 38),
         
         nameLbl.centerYAnchor.constraint(equalTo: avatarIV.centerYAnchor, constant: 8),
         nameLbl.leadingAnchor.constraint(equalTo: avatarIV.trailingAnchor, constant: textImagePadding),
         nameLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         nameLbl.heightAnchor.constraint(equalToConstant: 20),
         
         locationIV.bottomAnchor.constraint(equalTo: avatarIV.bottomAnchor),
         locationIV.leadingAnchor.constraint(equalTo: avatarIV.trailingAnchor, constant: textImagePadding),
         locationIV.heightAnchor.constraint(equalToConstant: 20),
         locationIV.widthAnchor.constraint(equalToConstant: 20),
         
         locationLbl.centerYAnchor.constraint(equalTo: locationIV.centerYAnchor),
         locationLbl.leadingAnchor.constraint(equalTo: locationIV.trailingAnchor, constant: 5),
         locationLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         locationLbl.heightAnchor.constraint(equalToConstant: 20),
         
         bioLbl.topAnchor.constraint(equalTo: avatarIV.bottomAnchor, constant: textImagePadding),
         bioLbl.leadingAnchor.constraint(equalTo: avatarIV.leadingAnchor),
         bioLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         bioLbl.heightAnchor.constraint(equalToConstant: 60)
      ])
   }
}
