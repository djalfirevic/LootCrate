//
//  Date+Extensions.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation

let dateFormatter = DateFormatter()
extension Date {
    
    static func date(from string: String) -> Date {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.date(from: string)!
    }
    
    var string: String {
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        return dateFormatter.string(from: self)
    }
    
}
