//
//  ContactTableViewCell.swift
//  Contacts App
//
//  Created by Wei lun Lai on 11/23/15.
//  Copyright © 2015 Digital Crafts. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet var contactImage: UIImageView!

    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var firstNameLabel: UILabel!
    
    var editContactId : String?
    private var editedContact: Contact?
    

}
