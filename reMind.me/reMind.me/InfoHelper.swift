//
//  InfoHelper.swift
//  reMind.me
//
//  Created by Akihiro Nakano on 2023/12/31.
//

import Foundation
import RealmSwift

class InfoHelper {
    
    let realm = try! Realm()
    
    func save(title:String,date:Date){
        let item = TaskItem()
        item.title = title
        item.date = date
        item.id = String(Int.random(in: 0...9999))
        try! realm.write{
            realm.add(item)
        }
    }
    
    func dateToString(date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm"
        return formatter.string(from: date)
    }
}
