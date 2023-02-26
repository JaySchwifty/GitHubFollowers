//
//  GFContainerView.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/15/23.
//

import UIKit

class GFContainerView: UIView {
   
   let titleLbl = GFTitleLabel(textAlignment: .center, fontSize: 20)
   let messageLbl = GFBodyLabel(textAlignment: .center)
   let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
   let padding: CGFloat = 20
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      config()
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   private func config() {
      layer.cornerRadius = 16
      layer.borderWidth = 2
      layer.borderColor = UIColor.white.cgColor
      backgroundColor = .systemBackground
      translatesAutoresizingMaskIntoConstraints = false
      
      addSubview(titleLbl)
      addSubview(messageLbl)
      addSubview(actionButton)
      
      NSLayoutConstraint.activate([
         titleLbl.topAnchor.constraint(equalTo: topAnchor, constant: padding),
         titleLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
         titleLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
         titleLbl.heightAnchor.constraint(equalToConstant: 28),
         
         actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
         actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
         actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
         actionButton.heightAnchor.constraint(equalToConstant: 44),
         
         messageLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 8),
         messageLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
         messageLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
         messageLbl.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
      ])
   }
   
}
