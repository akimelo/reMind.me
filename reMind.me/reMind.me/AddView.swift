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
        let helper = InfoHelper()
        helper.save(title:itemField.text!, date:datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
}
