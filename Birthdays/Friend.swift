//
//  Friend.swift
//  Birthdays
//
//  Created by Lily Mosisa on 4/24/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name : String
    var birthday : Date
    init(name: String, birthday: Date){
        self.name = name
        self.birthday = birthday
    }
}
