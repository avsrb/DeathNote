//
//  CreateNewLogViewController.swift
//  Death Note
//
//  Created by Artem Serebriakov on 11.08.2022.
//

import UIKit

class AddPersonViewController: UIViewController {
    
//    private lazy var backgroundImage: UIImageView = {
//            let image = UIImage(named: "paper")
//            let imageView = UIImageView(image: image)
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.contentMode = .scaleAspectFill
//
//            return imageView
//        }()
    
    private let nameTextField : UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.tintColor = .black
        textField.placeholder = "Fullname"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        textField.delegate = self

        return textField
    }()

    let datePicker = UIDatePicker()
    let descriptionTextField = UITextView()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
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
        navigationController?.popViewController(animated: true)
        print("DONE")
    }
    
    func setConstrains() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupUI() {
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(datePicker)
        stackView.addArrangedSubview(descriptionTextField)
    }
}
