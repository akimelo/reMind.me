//
//  AddView.swift
//  reMind.me
//
//  Created by Akihiro Nakano on 2023/12/31.
//

import UIKit
import RealmSwift

class AddView: UIViewController {

    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datePicker.timeZone = TimeZone.current
        datePicker.locale = Locale.current
    }
    
    @IBAction func onAdd(_ sender: Any) {
        let item = TaskItem()
        item.title = itemField.text!
        item.date = datePicker.date
        item.id = String(Int.random(in: 0...9999))
        try! realm.write{
            realm.add(item)
        }
        dismiss(animated: true, completion: nil)
    }
    
}
