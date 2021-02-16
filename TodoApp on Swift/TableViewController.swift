//
//  TableViewController.swift
//  TodoApp on Swift
//
//  Created by Towa Aoyagi on 2021/02/16.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    var contentArray = [String]()
    var keyArray =  [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let saveData: UserDefaults = UserDefaults.standard
        keyArray = saveData.object(forKey: "key") as! [String]
        print(keyArray)
        for i in keyArray {
            let contentValue = saveData.object(forKey: i) 
            contentArray.append(contentValue as! String)
        }
        table.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = contentArray[indexPath.row]
        return cell!
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