//
//  GFFollowerItemVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/1/23.
//

import UIKit

protocol GFFollowerItemVCDelegate: AnyObject {
   func didTapGetFollowers(for user: User)
}

class GFFollowerItemVC: GFItemInfoVC {
   
   weak var delegate: GFFollowerItemVCDelegate!
   
   
   init(user: User, delegate: GFFollowerItemVCDelegate) {
      super.init(user: user)
      self.delegate = delegate
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
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
