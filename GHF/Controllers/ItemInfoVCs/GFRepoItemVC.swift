//
//  GFRepoItemVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/1/23.
//

import UIKit

protocol GFRepoItemVCDelegate: AnyObject {
   func didTapGitHubProfile(for user: User)
}

class GFRepoItemVC: GFItemInfoVC {
   
   weak var delegate: GFRepoItemVCDelegate!
   // This needs to be weak to avoid retain cycles to the
   
   init(user: User, delegate: GFRepoItemVCDelegate) {
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
      itemInfoView1.set(itemInfoType: .repos, withCount: user.publicRepos)
      itemInfoView2.set(itemInfoType: .gits, withCount: user.publicGists)
      actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
   }
   
   
   override func actionButtonTapped() {
      delegate.didTapGitHubProfile(for: user)
      print("GitHub button was tapped")
   }
}
