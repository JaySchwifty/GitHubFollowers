//
//  MainView.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/10/23.
//

import UIKit

class SearchView: UIView {
  
  let logoIV: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "gh-logo")
    return image
  }()
  
  let usernameTF = GFTextField()
  let getFollowersButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    config()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func config() {
    backgroundColor = .systemBackground
    addSubview(logoIV)
    addSubview(usernameTF)
    addSubview(getFollowersButton)
    
    usernameTF.text = "Sallen0400"
    
    NSLayoutConstraint.activate([
      logoIV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
      logoIV.centerXAnchor.constraint(equalTo: centerXAnchor),
      logoIV.heightAnchor.constraint(equalToConstant: 200),
      logoIV.widthAnchor.constraint(equalToConstant: 200),
      
      usernameTF.topAnchor.constraint(equalTo: logoIV.bottomAnchor, constant: 48),
      usernameTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
      usernameTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
      usernameTF.heightAnchor.constraint(equalToConstant: 50),
      
      getFollowersButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
      getFollowersButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
      getFollowersButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
      getFollowersButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
}
