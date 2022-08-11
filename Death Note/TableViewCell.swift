//
//  TableViewCell.swift
//  Death Note
//
//  Created by Artem Serebriakov on 10.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let name = UILabel(text: "Steve Jobs", font: UIFont.systemFont(ofSize: 15))
    let date = UILabel(text: "October 5, 2011", font: UIFont.systemFont(ofSize: 15), textAlignment: .right)
//    let dateDead: UIDatePicker = {
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .dateAndTime
//        datePicker.setDate(.now, animated: true)
//        return datePicker
//    }()
    let reason = UILabel(text: "Cancer", font: UIFont.systemFont(ofSize: 12))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        reason.numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setConctrains()
    }
    
    func setConctrains() {
        self.addSubview(name)
        self.addSubview(date)
        self.addSubview(reason)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            name.widthAnchor.constraint(equalToConstant: self.frame.width / 2 - 10),
            name.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            date.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            date.widthAnchor.constraint(equalToConstant: self.frame.width / 2 - 10),
            date.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            reason.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 35),
            reason.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            reason.widthAnchor.constraint(equalToConstant: self.frame.width - 30),
            reason.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
