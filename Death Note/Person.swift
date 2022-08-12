//
//  Person.swift
//  Death Note
//
//  Created by Artem Serebriakov on 11.08.2022.
//

import UIKit

struct Person {
    var name: String
    var date: String
    var descriptionDead: String
    
    static var createExample: [Person] {
        return [
                Person(name: "Ekaterina Ivanov", date: Date("13/08/22 21:00").toString(), descriptionDead: "Car accident"),
                Person(name: "Stepan Pupkin", date: Date("24/12/24 21:00").toString(), descriptionDead: "old"),
                Person(name: "Ivan Ivanov", date: Date("13/08/22 21:00").toString(), descriptionDead: "Car accident")
        ]
    }
}

