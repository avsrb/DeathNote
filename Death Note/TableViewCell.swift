//
//  TableViewCell.swift
//  Death Note
//
//  Created by Artem Serebriakov on 10.08.2022.
//

import UIKit
//    let dateDead: UIDatePicker = {
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .dateAndTime
//        datePicker.setDate(.now, animated: true)
//        return datePicker
//    }()

class TableViewCell: UITableViewCell {
    
    var name = UILabel(font: UIFont.systemFont(ofSize: 15))
    var date = UILabel(font: UIFont.systemFont(ofSize: 15), textAlignment: .right)
    var reason = UILabel(font: UIFont.systemFont(ofSize: 12))
        
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .lightGray

        return stackView
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setConctrains()
        
        reason.numberOfLines = 0
        name.numberOfLines = 1
    }
//    override func prepareForReuse() {
//        setConctrains()
//    }
//
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//   из-за это была какая херь
//    override func layoutSubviews() {
//        setConctrains()
//    }
    
    func setConctrains() {
        horizontalStackView.addArrangedSubview(name)
        horizontalStackView.addArrangedSubview(date)
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(reason)
        
        self.addSubview(verticalStackView)

        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),// constant: 5),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
