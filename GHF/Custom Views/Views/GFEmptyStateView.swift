//
//  GFEmptyStateView.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/26/23.
//

import UIKit

class GFEmptyStateView: UIView {
   
   let messageLbl = GFTitleLabel(textAlignment: .center, fontSize: 28)
   let logoIV = UIImageView()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      config()
   }
   
   
   init(message: String) {
      super.init(frame: .zero)
      self.messageLbl.text = message
      config()
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   private func config() {
      addSubview(messageLbl)
      messageLbl.numberOfLines = 3
      messageLbl.textColor = .secondaryLabel
      
      addSubview(logoIV)
      logoIV.translatesAutoresizingMaskIntoConstraints = false
      logoIV.image = UIImage(named: "empty-state-logo")
      
      NSLayoutConstraint.activate([
         messageLbl.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
         messageLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
         messageLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
         messageLbl.heightAnchor.constraint(equalToConstant: 200),
         
         logoIV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 170),
         logoIV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
      ])
   }
   
}
