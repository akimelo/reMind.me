//
//  TaskItem.swift
//  reMind.me
//
//  Created by Akihiro Nakano on 2023/12/31.
//

import Foundation
import RealmSwift

class TaskItem:Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var date = Date()
    
}
