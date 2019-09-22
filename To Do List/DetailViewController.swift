//
//  DetailViewController.swift
//  To Do List
//
//  Created by Richard Jove on 9/20/19.
//  Copyright © 2019 Richard Jove. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    var toDoItem: String? //Declares variable but doesn't initialize it.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem //Take non-nil item and slap it into text property of to-do field
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
        }
    }
    
    func enableDisableSaveButton() { //Toggle save button on and off
            if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
                saveBarButton.isEnabled = true
            } else {
                saveBarButton.isEnabled = false
            }
        }

    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableSaveButton()
    }

    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
