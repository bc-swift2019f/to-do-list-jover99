//
//  ViewController.swift
//  To Do List
//
//  Created by Richard Jove on 9/19/19.
//  Copyright © 2019 Richard Jove. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var toDoArray = ["Learn Swift","Build Apps","Change the world!"] //Declared array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self //Delegate allows tableView to send messages to ViewController
        tableView.dataSource = self //dataSource tells tableView it's going to get its data from the ViewController
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource { //Put all of our tableView code down here
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //Function definition is not just name but also function
        return toDoArray.count //Number of rows in total that we have. Data comes from ViewController's toDoArray
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) //Create a UITableViewCell named cell using the identifier "Cell" we set on Main.storyboard
        cell.textLabel?.text = toDoArray[indexPath.row] //Cell has object inside of it called textLabel
        return cell
    }
}

