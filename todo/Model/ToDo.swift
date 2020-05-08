//
//  ToDo.swift
//  todo
//
//  Created by Jody Abney on 5/7/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import Foundation

struct ToDo: Codable {
    let item: String
    let priority: Int
}

struct ToDos: Codable {
    let items: Array<ToDo>
}
