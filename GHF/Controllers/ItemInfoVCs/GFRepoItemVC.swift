//
//  GFRepoItemVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/1/23.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
   
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
