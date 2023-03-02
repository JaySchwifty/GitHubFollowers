//
//  UserInfoVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/26/23.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject {
   func didTapGitHubProfile(for user: User)
   func didTapGetFollowers(for user: User)
}

class UserInfoVC: UIViewController {
   
   let headerView = UIView()
   let itemView1 = UIView()
   let itemView2 = UIView()
   let dateLbl = GFBodyLabel(textAlignment: .center)
   var itemViews: [UIView] = []
   
   var username: String! // forced unrwapped because im passing data that will use this and be handled if nil or not.
   weak var delegate: FollowerListVCDelegate!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configViewController()
      layoutUI()
      getUserInfo()
   }
   
   
   func configViewController() {
      view.backgroundColor = .systemBackground
      let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
      navigationItem.rightBarButtonItem = doneButton
   }
   
   
   func getUserInfo() {
      
      NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
         guard let self = self else { return }
         
         switch result {
         case .success(let user):
            DispatchQueue.main.async { self.configUIElements(with: user) }
            
         case .failure(let error):
            self.presentGFAlertOnMainThread(title: "Something went wrong!", message: error.rawValue, buttonTitle: "Ok")
         }
      }
   }
   
   
   func configUIElements(with user: User) {
      
      let repoItemVC = GFRepoItemVC(user: user)
      repoItemVC.delegate = self
      
      let followerItemVC = GFFollowerItemVC(user: user)
      followerItemVC.delegate = self
      
      self.add(childVC: repoItemVC, to: self.itemView1)
      self.add(childVC: followerItemVC, to: self.itemView2)
      self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
      self.dateLbl.text = "GitHub since \(user.createdAt.convertToDisplayFormat())"
   }
   
   
   func layoutUI() {
      
      itemViews = [headerView, itemView1, itemView2, dateLbl]
      
      let padding: CGFloat = 20
      let itemHeight: CGFloat = 140
      
      for itemView in itemViews {
         view.addSubview(itemView)
         itemView.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
            itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
         ])
      }
      
      NSLayoutConstraint.activate([
         headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         headerView.heightAnchor.constraint(equalToConstant: 180),
         
         itemView1.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
         itemView1.heightAnchor.constraint(equalToConstant: itemHeight),
         
         itemView2.topAnchor.constraint(equalTo: itemView1.bottomAnchor, constant: padding),
         itemView2.heightAnchor.constraint(equalToConstant: itemHeight),
         
         dateLbl.topAnchor.constraint(equalTo: itemView2.bottomAnchor, constant: padding),
         dateLbl.heightAnchor.constraint(equalToConstant: 18)
      ])
   }
   
   
   func add(childVC: UIViewController, to containerView: UIView) {
      addChild(childVC)
      containerView.addSubview(childVC.view)
      childVC.view.frame = containerView.bounds
      childVC.didMove(toParent: self)
   }
   
   
   @objc func dismissVC() {
      dismiss(animated: true)
   }
}


extension UserInfoVC: UserInfoVCDelegate {
   func didTapGitHubProfile(for user: User) {
      guard let url = URL(string: user.htmlUrl) else {
         presentGFAlertOnMainThread(title: "Invalid URL", message: "The url attatched to this user is invalid.", buttonTitle: "Ok")
         return
      }
      presentSafariVC(with: url)
   }
   
   func didTapGetFollowers(for user: User) {
      guard user.followers != 0 else {
         presentGFAlertOnMainThread(title: "No followers", message: "this user has no followers 😭", buttonTitle: "So sad")
         return
      }
      delegate.didRequestFollowers(for: user.login)
      dismissVC()
   }
}
