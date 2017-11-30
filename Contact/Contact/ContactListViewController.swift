//
//  ContactListViewController.swift
//  Contact
//
//  Created by Nathan Schlechte on 11/29/17.
//  Copyright © 2017 Nathan Schlechte. All rights reserved.
//

import UIKit
import CoreData

class ContactListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var contactTableView: UITableView!
    
    var contacts = [Contact]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactTableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        
        let contact = contacts[indexPath.row]
        if let cell = cell as? ContactCellTableViewCell {
            cell.nameLable.text = contact.name
            cell.numberLabel.text = contact.phoneNumber
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteContact(at: indexPath)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        do {
            contacts = try managedContext.fetch(fetchRequest)
            
            contactTableView.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
    }
    
    func deleteContact(at indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        
        if let managedContext = contact.managedObjectContext {
            managedContext.delete(contact)
            
            do {
                try managedContext.save()
                self.contacts.remove(at: indexPath.row)
                contactTableView.deleteRows(at: [indexPath], with: .automatic)
            } catch {
                print("Delete failed")
                contactTableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
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
