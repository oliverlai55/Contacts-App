//
//  ContactListViewController.swift
//  Contacts App
//
//  Created by Wei lun Lai on 11/9/15.
//  Copyright © 2015 Digital Crafts. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
            let cell = UITableViewCell()
            cell.textLabel?.text = "\(contact.firstName!) \(contact.lastName!)"
            return cell
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
    }
    
    
}
