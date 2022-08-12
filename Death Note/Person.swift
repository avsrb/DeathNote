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
    
    func createExample() -> [Person] {
        return [
                    Person(name: "Steve Jobs", date: "01 obercto", descriptionDead: "Cancer"),
                    Person(name: "Steve Jobs", date: "01 obercto", descriptionDead: "Cancer"),
                    Person(name: "Steve Jobs", date: "01 obercto", descriptionDead: "Cancer"),
            ]
    }
}

