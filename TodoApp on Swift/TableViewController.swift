//
//  TableViewController.swift
//  TodoApp on Swift
//
//  Created by Towa Aoyagi on 2021/02/16.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var button: UIButton!
    //var contentArray = [String]()
    var keyArray =  [String]()
    var query_word: String = ""
    var content_array: [Content] = []
    var segue_toKey: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 32
        
        let saveData: UserDefaults = UserDefaults.standard
        keyArray = saveData.object(forKey: "key") as! [String]
        for i in keyArray {
            let contentValue = saveData.object(forKey: i) 
            //contentArray.append(contentValue as! String)
            content_array.append(Content(contents: contentValue as! String, datekeys: i))
        }
        table.dataSource = self
        table.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = content_array[indexPath.row].content
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        segue_toKey = keyArray[indexPath.row]
        performSegue(withIdentifier: "toEdit", sender: nil)
        
    }
    func serch(query: String){
        for word in content_array{
            if word.content == query{
                content_array.removeAll()
                content_array.append(Content(contents: word.content, datekeys: word.datekey))
                table.reloadData()
            }
        }
    }
    func sorted_name_Array() {
        content_array.sort{ $0.content < $1.content}
        table.reloadData()
        
    }
    func sorted_date_Array() {
        content_array.sort{ $0.datekey > $1.datekey}
        table.reloadData()
        
    }
    
    
    @IBAction func serch_sorted() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.title = "メモを検索・並び替えできます"
        
        alert.addTextField(configurationHandler: { [self](textField) -> Void in
            textField.delegate = self
            query_word = textField.text!
            
        })
        alert.addAction(
            UIAlertAction(
                title: "検索",
                style: .default,
                handler: {action in self.serch(query: self.query_word)
                })
        )
        alert.addAction(
            UIAlertAction(
                title: "名前順",
                style: .default,
                handler: {action in self.sorted_name_Array()
                })
        )
        alert.addAction(
            UIAlertAction(
                title: "日付順",
                style: .default,
                handler: {action in self.sorted_date_Array()
                })
        )
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEdit" {
            let next = segue.destination as? EditViewController
            next?.segue_key = self.segue_toKey
        }
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
