//
//  SearchVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/13/23.
//

import UIKit

class SearchVC: UIViewController {
  
  let searchView = SearchView()
  
  var isUsernameEntered: Bool { return !searchView.usernameTF.text!.isEmpty }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = searchView
    searchView.usernameTF.delegate = self
    searchView.getFollowersButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
    crateDismissKeyboardTapGesture()
  }

  
  func crateDismissKeyboardTapGesture() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }

  
  @objc func pushFollowerListVC() {
    
    guard isUsernameEntered else {
      presentGFAlertOnMainThread(title: "Empty username", message: "Please enter a username. We need to know who to look for 😄", buttonTitle: "Ok")
      return
    }
    
    let followerListVC = FollowerListVC()
    followerListVC.username = searchView.usernameTF.text
    followerListVC.title = searchView.usernameTF.text
    navigationController?.pushViewController(followerListVC, animated: true)
  }
}

extension SearchVC: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    pushFollowerListVC()
    return true
  }
}
