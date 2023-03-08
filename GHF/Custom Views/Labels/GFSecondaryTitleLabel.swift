//
//  GFSecondaryTitleLabel.swift
//  GHF
//
//  Created by Jaron Grigsby on 2/28/23.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      config()
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   convenience init(fontSize: CGFloat) {
      self.init(frame: .zero)
      font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
   }
   
   
   private func config() {
      textColor                        = .secondaryLabel
      adjustsFontSizeToFitWidth        = true
      minimumScaleFactor               = 0.90
      lineBreakMode                    = .byTruncatingTail
      translatesAutoresizingMaskIntoConstraints = false
   }
   
}
