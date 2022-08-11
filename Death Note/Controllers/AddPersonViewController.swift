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
    var person: Person { get }
}


class AddPersonViewController: UIViewController, PersonProtocol {
    

//    private lazy var backgroundImage: UIImageView = {
//            let image = UIImage(named: "paper")
//            let imageView = UIImageView(image: image)
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.contentMode = .scaleAspectFill
//
//            return imageView
//        }()
    weak var delegate: AddPersonViewControllerDelegate?

    var person: Person {
        Person(name: nameTextField.text!, date: "0000", descriptionDead: descriptionTextField.text!)
      }
    //       if !nameTextField.text!.isEmpty {
//            let newPerson = Person(name: nameTextField.text!, data: "01 10 2010", descriptionDead: descriptionTextField.text!)
//        }

    
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
//        textField.delegate = self

        return textField
    }()

    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.timeZone = NSTimeZone.local
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .dateAndTime
        datePicker.translatesAutoresizingMaskIntoConstraints = false
//        datePicker.delegate = self()
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
//        tableView.delegate = self
//        tableView.dataSource = self
        let buttonDone = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(buttonDonePressed))
        self.navigationItem.rightBarButtonItem = buttonDone

        title = "Add a Person"

        setupUI()
        setConstrains()
    }
    

    @objc func buttonDonePressed() {
//        delegate?.savePerson(person: Person.createExample())
//        let newContactVC = segue.destination as! NewContactViewController
//                newContactVC.delegate = self

        
        
        delegate?.savePerson(person: person)
        navigationController?.popViewController(animated: true)
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
    }
    
    func setupUI() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(descriptionTextField)
    }
}


//extension AddPersonViewController: AddPersonViewControllerDelegate {
//    func savePerson(person: Person) {
//        people.append(person)
//    }
//
//}
