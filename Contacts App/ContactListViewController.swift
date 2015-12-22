//
//  ContactListViewController.swift
//  Contacts App
//
//  Created by Wei lun Lai on 11/9/15.
//  Copyright © 2015 Digital Crafts. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewContactDelegate {

    var contacts : [Contact]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contacts = DataManager.sharedManager.loadContacts()

        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var tableView: UITableView!

    func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
            return (self.contacts?.count)!
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            //First get the contact for the row
            let contact = self.contacts![indexPath.row]
            if let cell =
                tableView.dequeueReusableCellWithIdentifier("contactCellReuseID",
                    forIndexPath: indexPath) as? ContactTableViewCell {
                        cell.firstNameLabel.text = contact.firstName
                        cell.lastNameLabel.text = contact.lastName
                        
                        if indexPath.row % 2 == 0 {
                            cell.contactImage.image = UIImage(named: "Contact_Female")
                        }
                        else {
                            cell.contactImage.image = UIImage(named: "Contact_Male")
                        }
                        
                        return cell
            }
            return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath
        indexPath: NSIndexPath) {
            self.performSegueWithIdentifier("ContactsDetailSegue", sender:
                self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender:
        AnyObject?) {
            if segue.identifier == "ContactsDetailSegue" {
                if let selectedCell =
                    self.tableView.indexPathForSelectedRow {
                        let selectedContact = self.contacts![selectedCell.row]
                        if let detailVC = segue.destinationViewController as?
                            ContactsDetailViewController {
                                detailVC.selectedContact = selectedContact
                        }
                }
            }
            else if segue.identifier == "NewContactSegue" {
                if let newContactVC = segue.destinationViewController as?
                    NewContactViewController {
                        newContactVC.delegate = self
                }
            }
    }
    
    func didCreateNewContact(newContact: Contact) {
        self.contacts?.append(newContact)
       
        self.tableView.reloadData()
    }
    
    
    @IBAction func importButtonTouched(sender: AnyObject) {
        let wsm = WebServiceManager()
        wsm.fetchContacts { (newContacts) -> Void in
            //Code in closure goes here
            for contact in newContacts {
                self.contacts?.append(contact)
              
            }
        }
    }
    
    
    @IBAction func refreshButtonTouched(sender: UIBarButtonItem) {
        self.tableView.reloadData()
    }
    
}
