//
//  ViewController.swift
//  Death Note
//
//  Created by Artem Serebriakov on 10.08.2022.
//

import UIKit

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        // убрать отягивание
        //tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let idCell = "cell"
    var people: [Person] = [Person(name: "First", date: "01-01-1971", descriptionDead: "killed")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        title = "Death Note"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setConstrains()
        
        //Registers a class to use in creating new table cells.
        tableView.register(TableViewCell.self, forCellReuseIdentifier: idCell)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTaped))
    }
    
    @objc func addButtonTaped() {
        let addPerson = AddPersonViewController()
        addPerson.delegate = self
        navigationController?.pushViewController(addPerson, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! TableViewCell
        let person = people[indexPath.row]
 
        cell.name.text = person.name
        cell.date.text = person.date
        cell.reason.text = person.descriptionDead
        
        DispatchQueue.main.async {
            tableView.reloadData()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        90
//    }
}

extension ViewController {
    func setConstrains() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
        
}

extension ViewController: AddPersonViewControllerDelegate {
    func savePerson(person: Person) {
        people.append(person)
        print(people)
    }
}
