//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-06-15.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
