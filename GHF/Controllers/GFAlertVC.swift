//
//  GFAlertVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/15/23.
//

import UIKit

class GFAlertVC: UIViewController {
  
  let containerView = GFContainerView()

  var alertTitle: String?
  var message: String?
  var buttonTitle: String?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    config()
  }
  
  
  init(title: String, message: String, buttonTitle: String) {
    super.init(nibName: nil, bundle: nil)
    self.alertTitle = title
    self.message = message
    self.buttonTitle = buttonTitle
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func config() {
    
    view.addSubview(containerView)
    
    containerView.titleLbl.text = alertTitle ?? "Something went wrong"
    containerView.messageLbl.text = message ?? "Unable to complete request"
    containerView.messageLbl.numberOfLines = 4
    containerView.actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
    containerView.actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.widthAnchor.constraint(equalToConstant: 280),
      containerView.heightAnchor.constraint(equalToConstant: 220),
    ])
  }
  
  
  @objc func dismissVC() {
    dismiss(animated: true)
  }
}
