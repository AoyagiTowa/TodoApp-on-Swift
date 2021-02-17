//
//  ViewController.swift
//  TodoApp on Swift
//
//  Created by Towa Aoyagi on 2021/02/15.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    let saveData: UserDefaults = UserDefaults.standard
    var keyArray: [String] = []
    var saveCount = Int.random(in: 1000...9999)

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.timeZone = NSTimeZone.local
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ja_JP")
        let saveData: UserDefaults = UserDefaults.standard
        if saveData.object(forKey: "key") as? [String] != nil {
            keyArray = saveData.object(forKey: "key") as! [String]
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func get() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        saveData.set(textField.text, forKey: formatter.string(from: datePicker.date) + String(saveCount))
        keyArray.append(formatter.string(from: datePicker.date) + String(saveCount))
        saveData.set(keyArray, forKey: "key")
        self.performSegue(withIdentifier: "toBuildTable", sender: nil)
        print(keyArray)
        
    }
    
}

