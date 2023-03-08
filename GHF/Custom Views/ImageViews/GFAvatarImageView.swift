//
//  GFAvatarImageView.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/21/23.
//

import UIKit

class GFAvatarImageView: UIImageView {
   
   let placeholderImage    = Images.placeholder
   let cache               = NetworkManager.shared.cache

   override init(frame: CGRect) {
      super.init(frame: frame)
      config()
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   private func config() {
      layer.cornerRadius   = 10
      clipsToBounds        = true
      image                = placeholderImage
      translatesAutoresizingMaskIntoConstraints = false
   }
   
   
   func downloadImage(fromURL url: String) {
      NetworkManager.shared.downloadImage(from: url) { [weak self] image in
         guard let self = self else { return }
         DispatchQueue.main.async { self.image = image }
      }
   }

}
