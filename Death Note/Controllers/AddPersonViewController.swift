//
//  CreateNewLogViewController.swift
//  Death Note
//
//  Created by Artem Serebriakov on 11.08.2022.
//

import UIKit

protocol AddPersonViewControllerDelegate: AnyObject {
    func savePerson(person: Person)
}

protocol PersonProtocol {
    var person: Person { get set }
}

class AddPersonViewController: UIViewController {

//    private lazy var backgroundImage: UIImageView = {
//            let image = UIImage(named: "paper")
//            let imageView = UIImageView(image: image)
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.contentMode = .scaleAspectFill
//
//            return imageView
//        }()
    weak var delegate: AddPersonViewControllerDelegate?
    
    private let nameTextField : UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.tintColor = .white
        textField.placeholder = "Name"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.timeZone = NSTimeZone.local
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .dateAndTime
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "This person will die because"
        textField.textColor = .white
        textField.tintColor = .white
        textField.borderStyle = .line
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonDone = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(buttonDonePressed))
        self.navigationItem.rightBarButtonItem = buttonDone

        title = "Add a Person"

        setupUI()
        setConstrains()
    }
    

    @objc func buttonDonePressed() {
        let person = Person(name: nameTextField.text!, date: datePicker.date.toString(), descriptionDead: descriptionTextField.text!)
        
        delegate?.savePerson(person: person)
        navigationController?.popViewController(animated: true)
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(greaterThanOrEqualTo: view.centerYAnchor)
        ])
        
    }
    
    func setupUI() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(descriptionTextField)
    }
}
