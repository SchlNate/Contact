//
//  Contact+CoreDataClass.swift
//  Contact
//
//  Created by Nathan Schlechte on 11/29/17.
//  Copyright © 2017 Nathan Schlechte. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Contact)
public class Contact: NSManagedObject {

    convenience init?(name: String?, phoneNumber: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Contact.entity(), insertInto: managedContext)
        
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
