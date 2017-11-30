//
//  Contact+CoreDataProperties.swift
//  Contact
//
//  Created by Nathan Schlechte on 11/29/17.
//  Copyright © 2017 Nathan Schlechte. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?

}
