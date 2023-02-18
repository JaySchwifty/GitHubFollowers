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
  }
  
  
}
