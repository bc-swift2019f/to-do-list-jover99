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
    @IBOutlet weak var toDoNoteView: UITextView!
    var toDoItem: String? //Declares variable but doesn't initialize it.
    var toDoNoteItem: String? //Won't have anything to pass over if we click on plus sign.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem //Take non-nil item and slap it into text property of to-do field
            self.navigationItem.title = "Edit To Do Item"
        } else {
            self.navigationItem.title = "New To Do Item"
        }
        if let toDoNoteItem = toDoNoteItem { //Why don't have to do it here too?
            toDoNoteView.text = toDoNoteItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
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
