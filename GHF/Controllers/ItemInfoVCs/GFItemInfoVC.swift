//
//  GFItemInfoVC.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/1/23.
//

import UIKit

class GFItemInfoVC: UIViewController {
   
   let stackView     = UIStackView()
   let itemInfoView1 = GFItemInfoView()
   let itemInfoView2 = GFItemInfoView()
   let actionButton  = GFButton()
   
   var user: User!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configBackgroundView()
      layoutUI()
      configStackView()
      configActionButton()
   }
   
   
   init(user: User) {
      super.init(nibName: nil, bundle: nil)
      self.user = user
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   private func configBackgroundView() {
      view.layer.cornerRadius    = 18
      view.backgroundColor       = .secondarySystemBackground
   }
   
   
   private func configStackView() {
      stackView.axis          = .horizontal
      stackView.distribution  = .equalSpacing
      
      stackView.addArrangedSubview(itemInfoView1)
      stackView.addArrangedSubview(itemInfoView2)
   }
   
   
   private func configActionButton() {
      actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
   }
   
   
   @objc func actionButtonTapped() {}
   
   
   private func layoutUI() {
      view.addSubviews(stackView, actionButton)
      
      stackView.translatesAutoresizingMaskIntoConstraints = false
      let padding: CGFloat = 20
      
      NSLayoutConstraint.activate([
         stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
         stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
         stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
         stackView.heightAnchor.constraint(equalToConstant: 50),
         
         actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
         actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
         actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
         actionButton.heightAnchor.constraint(equalToConstant: 44)
      ])
   }
}
