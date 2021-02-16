//
//  TableViewController.swift
//  TodoApp on Swift
//
//  Created by Towa Aoyagi on 2021/02/16.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    var cellArray = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellArray.append(0)
        
        table.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
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
