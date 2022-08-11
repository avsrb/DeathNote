//
//  ViewController.swift
//  Death Note
//
//  Created by Artem Serebriakov on 10.08.2022.
//

import UIKit


//let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
//        let theCharacter = allCharacters[indexPath.row]
//        cell.nameLabel.text = "\(theCharacter.name)"
//        cell.deathDate.text = "\(theCharacter.date)"
//        cell.deathDescription.numberOfLines = 0
//        cell.deathDescription.text = "\(theCharacter.description ?? "")"
//        return cell
//    }
//
//
//let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! RecipeTableViewCell
//
//        let recipe = categories[indexPath.section].recipes[indexPath.row]
//
//        cell.recipeTitleLable.text = recipe.title
//        cell.recipeIngredientsLabel.text = recipe.ingresients
//        cell.iconImageView.image = recipe.photo
//
//        return cell
//    }


class ViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        // убрать отягивание
        //tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let idCell = "cell"
    
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
        navigationController?.pushViewController(addPerson, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // кол-во строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! TableViewCell

        switch indexPath.row {
        case 0:
            cell.backgroundColor = .red
        case 1:
            cell.backgroundColor = .green
        default:
            cell.backgroundColor = .blue
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
