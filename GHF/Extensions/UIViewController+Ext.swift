//
//  UIViewController+Ext.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/15/23.
//

import UIKit
import SafariServices

//fileprivate var containerView: UIView! // nothing can access this unless it's within this folder i.e. the extd VC
extension UIViewController  {
   
   func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
      DispatchQueue.main.async {
         
         let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
         alertVC.modalPresentationStyle   = .overFullScreen // Wont show the card view
         alertVC.modalTransitionStyle     = .crossDissolve // will let it fade in
         self.present(alertVC, animated: true)
      }
   }
   
   
   func presentSafariVC(with url: URL) {
      let safariVC = SFSafariViewController(url: url)
      safariVC.preferredControlTintColor = .systemGreen
      present(safariVC, animated: true)
   }
}
