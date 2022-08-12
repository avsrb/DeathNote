//
//  Extention+UILabel.swift
//  Death Note
//
//  Created by Artem Serebriakov on 10.08.2022.
//

import UIKit

extension UILabel {
    convenience init(font: UIFont, textAlignment: NSTextAlignment = .left) {
        self.init()
        
//        self.text = text
        self.textColor = .black
        self.font = font
        self.textAlignment = textAlignment
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .orange
    }
}

