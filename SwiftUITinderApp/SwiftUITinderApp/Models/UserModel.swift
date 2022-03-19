//
//  UserModel.swift
//  SwiftUITinderApp
//
//  Created by Satish Sharma on 30/08/20.
//  Copyright © 2020 Satish Sharma. All rights reserved.
//

import Foundation


struct User: Hashable, CustomStringConvertible {
    
    var id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String
    
    var description: String {
        return "\(firstName), id: \(id)"
    }
}


// List of users
var cardusers: [User]  = [
    
    User(id: 0, firstName: "Harry", lastName: "Sharma", age: 26, mutualFriends: 4, imageName: "person1", occupation: "Software Engineer"),
    User(id: 1, firstName: "Gaurav", lastName: "kumar", age: 27, mutualFriends: 0, imageName: "person2", occupation: "Real estate Agent"),
    User(id: 2, firstName: "Rock", lastName: "Sham", age: 20, mutualFriends: 1, imageName: "person10", occupation: "Food Baba"),
    User(id: 3, firstName: "Kumar", lastName: "Jue", age: 22, mutualFriends: 4, imageName: "person4", occupation: "Historian"),
    User(id: 4, firstName: "Jaun", lastName: "Carlo", age: 24, mutualFriends:18, imageName: "person5", occupation: "Agent"),
    User(id: 5, firstName: "James", lastName: "Bond", age: 29, mutualFriends: 3, imageName: "person6", occupation: "Actor"),
    User(id: 6, firstName: "Jones", lastName: "Strange", age: 25, mutualFriends: 16, imageName: "person7", occupation: "Dentist"),
    User(id: 7, firstName: "Watson", lastName: "Pollack", age: 29, mutualFriends: 9, imageName: "person8", occupation: "Recreational Therapist"),
    User(id: 8, firstName: "Braun", lastName: "Strange", age: 23, mutualFriends: 5, imageName: "person9", occupation: "HR Manager"),
    User(id: 9, firstName: "Kumar", lastName: "Weber", age: 28, mutualFriends: 13, imageName: "person3", occupation: "Therapist")
]
    
