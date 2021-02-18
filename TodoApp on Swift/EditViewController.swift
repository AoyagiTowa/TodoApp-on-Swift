//
//  EditViewController.swift
//  TodoApp on Swift
//
//  Created by Towa Aoyagi on 2021/02/19.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    var segue_key:String = ""
    let saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(){
    }
    @IBAction func delete(){
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
