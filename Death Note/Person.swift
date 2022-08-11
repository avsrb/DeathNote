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
    
    func createExample() -> Person {
        Person(name: "Steve", date: "01 obercto", descriptionDead: "Cancer")
    }
}

