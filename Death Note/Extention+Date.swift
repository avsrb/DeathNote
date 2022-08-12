//
//  Extention+Date.swift
//  Death Note
//
//  Created by Artem Serebriakov on 12.08.2022.
//

import UIKit

extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd/MM/yy HH:mm"
        dateStringFormatter.timeZone = NSTimeZone.local
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    func toString() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy HH:mm"
        let selectedDate: String = dateFormatter.string(from: self)

        return selectedDate
    }
}
