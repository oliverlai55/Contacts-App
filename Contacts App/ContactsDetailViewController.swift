//
//  ContactsDetailViewController.swift
//  Contacts App
//
//  Created by Wei lun Lai on 11/9/15.
//  Copyright © 2015 Digital Crafts. All rights reserved.
//

import UIKit

class ContactsDetailViewController: UIViewController, NewContactDelegate  {
    
    var selectedContact : Contact!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.firstNameLabel.text = self.selectedContact.firstName
        self.lastNameLabel.text = self.selectedContact.lastName
        self.phoneNumberLabel.text = self.selectedContact.phoneNumber
        self.streetAddressLabel.text = self.selectedContact.address?.street
        self.cityLabel.text = self.selectedContact.address?.city
        self.stateLabel.text = self.selectedContact.address?.state
        self.zipCodeLabel.text = self.selectedContact.address?.zipCode
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBOutlet weak var firstNameLabel: UILabel!

    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var streetAddressLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var zipCodeLabel: UILabel!
    
   
    
    func didUpdateContact(contact: Contact) {
        self.selectedContact = contact
        self.updateTextFields()
    }
    
    func updateTextFields() {
            self.firstNameLabel.text = self.selectedContact?.firstName
            self.lastNameLabel.text = self.selectedContact?.lastName
            self.phoneNumberLabel.text = self.selectedContact?.phoneNumber
            self.streetAddressLabel.text = self.selectedContact?.address?.street
            self.cityLabel.text = self.selectedContact?.address?.city
            self.stateLabel.text = self.selectedContact?.address?.state
            self.zipCodeLabel.text = self.selectedContact?.address?.zipCode
    }
    
    func didCreateNewContact(newContact: Contact) {
                //
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    */
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "EditContactSegue" {
                if let vc = segue.destinationViewController as? NewContactViewController {
                    vc.delegate = self
                    vc.editContactId = self.selectedContact.contactId
                }
            }
        }
}

