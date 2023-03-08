//
//  UserInfoVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/26/23.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject {
   func didRequestFollowers(for username: String)
}

class UserInfoVC: GFDataLoadingVC {
   
   let scrollView             = UIScrollView()
   let contentView            = UIView()
   let headerView             = UIView()
   let itemView1              = UIView()
   let itemView2              = UIView()
   var itemViews: [UIView]    = []
   let dateLbl                = GFBodyLabel(textAlignment: .center)
   
   var username: String! // forced unrwapped because im passing data that will use this and be handled if nil or not.
   weak var delegate: UserInfoVCDelegate!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configViewController()
      configScrollView()
      layoutUI()
      getUserInfo()
   }
   
   
   private func configViewController() {
      view.backgroundColor    = .systemBackground
      let doneButton          = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
      navigationItem.rightBarButtonItem = doneButton
   }
   
   
   private func configScrollView() {
      view.addSubviews(scrollView)
      scrollView.addSubview(contentView)
      scrollView.pinToEdges(of: view)
      contentView.pinToEdges(of: scrollView)
      
      NSLayoutConstraint.activate([
         contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
         contentView.heightAnchor.constraint(equalToConstant: 600)
      ])
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
      let repoItemVC       = GFRepoItemVC(user: user, delegate: self)
//      repoItemVC.delegate = self NO LONGER NEEDED DUE TO THE LINE ABOVE !!!!
      
      let followerItemVC   = GFFollowerItemVC(user: user, delegate: self)
//      self.add(childVC: GFRepoItemVC(user: user, delegate: self), to: self.itemView1) THIS IS ANOTHER WAY OF DOING IT
      
      self.add(childVC: repoItemVC, to: self.itemView1)
      self.add(childVC: followerItemVC, to: self.itemView2)
      self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
      self.dateLbl.text = "GitHub since \(user.createdAt.convertToMonthYearFormat())"
   }
   
   
   func layoutUI() {
      itemViews = [headerView, itemView1, itemView2, dateLbl]
      
      let padding: CGFloat       = 20
      let itemHeight: CGFloat    = 140
      
      for itemView in itemViews {
         contentView.addSubview(itemView)
         itemView.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
         ])
      }
      
      NSLayoutConstraint.activate([
         headerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
         headerView.heightAnchor.constraint(equalToConstant: 210),
         
         itemView1.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
         itemView1.heightAnchor.constraint(equalToConstant: itemHeight),
         
         itemView2.topAnchor.constraint(equalTo: itemView1.bottomAnchor, constant: padding),
         itemView2.heightAnchor.constraint(equalToConstant: itemHeight),
         
         dateLbl.topAnchor.constraint(equalTo: itemView2.bottomAnchor, constant: padding),
         dateLbl.heightAnchor.constraint(equalToConstant: 50)
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


extension UserInfoVC: GFRepoItemVCDelegate, GFFollowerItemVCDelegate {
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
      print("Ruhoh")
      delegate.didRequestFollowers(for: user.login)
      dismissVC()
   }
}
