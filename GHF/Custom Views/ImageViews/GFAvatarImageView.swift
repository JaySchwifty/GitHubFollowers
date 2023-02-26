//
//  GFAvatarImageView.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/21/23.
//

import UIKit

class GFAvatarImageView: UIImageView {
   
   let placeholderImage = UIImage(named: "avatar-placeholder")!

   override init(frame: CGRect) {
      super.init(frame: frame)
      config()
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   private func config() {
      layer.cornerRadius = 10
      clipsToBounds = true
      image = placeholderImage
      translatesAutoresizingMaskIntoConstraints = false
   }
   
   
   func downloadImage(from urlString: String) {
      guard let url = URL(string: urlString) else { return }
      
      let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
         
         guard let self = self else { return }
         
         if error != nil { return }
         guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
         guard let data = data else { return }
         
         guard let image = UIImage(data: data) else { return }
         
         DispatchQueue.main.async {
            self.image = image
         }
      }
      
      task.resume()
   }

}
