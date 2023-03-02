//
//  GFFollowerItemVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/1/23.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configItems()
   }
   
   
   private func configItems() {
      itemInfoView1.set(itemInfoType: .followers, withCount: user.followers)
      itemInfoView2.set(itemInfoType: .following, withCount: user.following)
      actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
   }
   
   
   override func actionButtonTapped() {
      delegate.didTapGetFollowers(for: user)
      print("follower button was tapped")
   }
}
