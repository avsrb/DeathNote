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
        datePicker.minimumDate = Date.now
        return datePicker
    }()
    
    let descriptionTextField: UITextView = {
        let textView = UITextView()
        textView.textColor = .white
        textView.tintColor = .white
        textView.layer.borderColor = UIColor.white.cgColor
        textView.layer.borderWidth = 2
        textView.layer.cornerRadius = 15
        textView.textAlignment = .center
        textView.font = UIFont.systemFont(ofSize: 20)

        return textView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
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
        if !nameTextField.text!.isEmpty {
            
            let person = Person(name: nameTextField.text!, date: datePicker.date.toString(), descriptionDead: descriptionTextField.text!)
            
            delegate?.savePerson(person: person)
            navigationController?.popViewController(animated: false)
        } else {
            showAlert(title: "Who will die?", message: "Write how you want this person to die", firstAction: "I'll do it right now", secondAction: nil)
        }
        
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setupUI() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(descriptionTextField)
    }
}


extension AddPersonViewController {
    func showAlert(title: String, message: String, firstAction: String, secondAction: String?) {
           // create the alert
          let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

          // add the actions (buttons)
           alert.addAction(UIAlertAction(title: firstAction, style: UIAlertAction.Style.default, handler: nil))
           if let secondAction = secondAction {
               alert.addAction(UIAlertAction(title: secondAction, style: UIAlertAction.Style.cancel, handler: nil))
           }
          // show the alert
          self.present(alert, animated: true, completion: nil)
    }
}
