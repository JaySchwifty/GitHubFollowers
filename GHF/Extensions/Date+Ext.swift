//
//  Date+Ext.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/1/23.
//

import Foundation

extension Date {
   
   func convertToMonthYearFormat() -> String {
      
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMM yyyy"
      return dateFormatter.string(from: self)
   }
}
