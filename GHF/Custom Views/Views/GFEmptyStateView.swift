//
//  GFEmptyStateView.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/26/23.
//

import UIKit

class GFEmptyStateView: UIView {
   
   let messageLbl    = GFTitleLabel(textAlignment: .center, fontSize: 28)
   let logoIV        = UIImageView()
   
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
      addSubviews(messageLbl, logoIV)
      configMessageLabel()
      configLogoImageView()
   }
   
   
   private func configMessageLabel() {
      messageLbl.numberOfLines   = 3
      messageLbl.textColor       = .secondaryLabel
      
      let labelCenterYConstant: CGFloat      = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -80 : -150
      
      NSLayoutConstraint.activate([
         messageLbl.centerYAnchor.constraint(equalTo: centerYAnchor, constant: labelCenterYConstant),
         messageLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
         messageLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
         messageLbl.heightAnchor.constraint(equalToConstant: 200)
      ])
   }
   
   
   private func configLogoImageView() {
      logoIV.translatesAutoresizingMaskIntoConstraints = false
      logoIV.image = Images.emptyStateLogo
      
      let logoBottomConstant: CGFloat  = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 80 : 40
      
      NSLayoutConstraint.activate([
         logoIV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: logoBottomConstant),
         logoIV.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
         logoIV.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
         logoIV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 170),
      ])
   }
   
}
