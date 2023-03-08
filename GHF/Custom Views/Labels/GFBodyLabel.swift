//
//  GFBodyLabel.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/15/23.
//

import UIKit

class GFBodyLabel: UILabel {
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      config()
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   convenience init(textAlignment: NSTextAlignment) {
      self.init(frame: .zero)
      self.textAlignment = textAlignment
   }
   
   
   private func config() {
      textColor                           = .secondaryLabel
      font                                = UIFont.preferredFont(forTextStyle: .body)
      adjustsFontForContentSizeCategory   = true
      adjustsFontSizeToFitWidth           = true
      minimumScaleFactor                  = 0.75
      lineBreakMode                       = .byWordWrapping
      translatesAutoresizingMaskIntoConstraints = false
   }
}
