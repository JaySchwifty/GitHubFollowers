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
   
   
   init(fontSize: CGFloat) {
      super.init(frame: .zero)
      font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
      config()
   }
   
   
   private func config() {
      textColor = .secondaryLabel
      adjustsFontSizeToFitWidth = true
      minimumScaleFactor = 0.90
      lineBreakMode = .byTruncatingTail
      translatesAutoresizingMaskIntoConstraints = false
   }
   
}
