//
//  SingleContactViewController.swift
//  Contact
//
//  Created by Nathan Schlechte on 11/29/17.
//  Copyright © 2017 Nathan Schlechte. All rights reserved.
//

import UIKit

class SingleContactViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        phoneNumberField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveContact(_ sender: Any) {
        let name = nameField.text
        let phoneNumber = phoneNumberField.text
        
        if let contact = Contact(name: name, phoneNumber: phoneNumber) {
            do {
                let managedContext = contact.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            } catch {
                print("Context could not be saved")
            }
        }
        
    }
    @IBAction func cancelCreation(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.resignFirstResponder()
        phoneNumberField.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SingleContactViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
