//
//  String+Ext.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/1/23.
//

import Foundation

extension String {
   
   func convertToDate() -> Date? {
      
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyy-MM-dd'T'HH:mm:ssZ"
      dateFormatter.locale = Locale(identifier: "en_US_POSIX")
      dateFormatter.timeZone = .current
      
      return dateFormatter.date(from: self)
   }
   
   
   func convertToDisplayFormat() -> String {
      guard let date = self.convertToDate() else { return "N/A"}
      return date.convertToMonthYearFormat()
   }
}
