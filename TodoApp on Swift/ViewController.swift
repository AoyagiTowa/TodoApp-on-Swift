//
//  ViewController.swift
//  TodoApp on Swift
//
//  Created by Towa Aoyagi on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.timeZone = NSTimeZone.local
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ja_JP")
        
        

        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func get() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        print((formatter.string(from: datePicker.date)))
    }
}

