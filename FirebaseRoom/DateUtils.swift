//
//  DateFormatter.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/31.
//  Copyright © 2017年 Katy. All rights reserved.
//

import Foundation

class DateUtils {
    
    static let DATE_TIME_FORMAT: String = "yyyy-MM-dd HH:mm:ss"
    
    static func toDateTimeString(timestampInSec: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DATE_TIME_FORMAT
        return formatter.string(from: NSDate(timeIntervalSince1970: TimeInterval(timestampInSec)) as Date)
    }
}
