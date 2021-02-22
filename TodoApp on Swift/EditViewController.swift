//
//  EditViewController.swift
//  TodoApp on Swift
//
//  Created by Towa Aoyagi on 2021/02/19.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    var segue_key: String!
    let saveData: UserDefaults = UserDefaults.standard
    var keyArray =  [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let saveData: UserDefaults = UserDefaults.standard
        let contentValue = saveData.object(forKey: segue_key)
        textField.text = contentValue as? String
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(){
        saveData.set(textField.text, forKey: segue_key)
        self.performSegue(withIdentifier: "ToBuild", sender: nil)
    }
    @IBAction func delete(){
        keyArray = saveData.object(forKey: "key") as! [String]
        for i in keyArray {
            if i == segue_key{
                keyArray.removeAll(where: {$0 == i})
                UserDefaults.standard.removeObject(forKey: i)
            }
        }
        saveData.set(keyArray, forKey: "key")
        self.performSegue(withIdentifier: "ToBuild", sender: nil)
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
