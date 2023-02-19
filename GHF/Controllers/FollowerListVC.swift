//
//  FollowerListVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/15/23.
//

import UIKit

class FollowerListVC: UIViewController {
   
   var username: String!
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.setNavigationBarHidden(false, animated: true)
   }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .systemBackground
      navigationController?.navigationBar.prefersLargeTitles = true
      
      NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errormessage in
         guard let followers = followers else {
            self.presentGFAlertOnMainThread(title: "Bad stuff happened", message: errormessage!, buttonTitle: "Ok")
            return
         }
         
         print("Followers.count = \(followers.count)")
         print(followers)
      }
   }
   
   
}
