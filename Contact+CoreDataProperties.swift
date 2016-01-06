//
//  Contact+CoreDataProperties.swift
//  Contacts App
//
//  Created by Wei lun Lai on 1/6/16.
//  Copyright © 2016 Digital Crafts. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var contactId: String?
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var phoneNumber: String?
    @NSManaged var address: Address?

}
