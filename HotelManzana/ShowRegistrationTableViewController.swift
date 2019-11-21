//
//  ShowRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Soft Dev on 10/29/19.
//  Copyright © 2019 Alice Zhong. All rights reserved.
//

import UIKit

class ShowRegistrationTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // update
        updateInformation()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // Outlets for all the labels
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkingInDateLabel: UILabel!
    @IBOutlet weak var checkingOutDateLabel: UILabel!
    @IBOutlet weak var adultsNumberLabel: UILabel!
    @IBOutlet weak var childrenNumberLabel: UILabel!
    @IBOutlet weak var wifiLabel: UILabel!
    @IBOutlet weak var roomtypeLabel: UILabel!
    
    // hold the registration instance
    var registration = Registration(firstName: " ", lastName: " ", emailAddress: " ", checkInDate: Date(), checkOutDate: Date(), numberOfAdults: 0, numberOfChildren: 0, wifi: false, roomType: RoomType(id: 0, name: " ", shortName: " ", price: 0))
    
    // pass in information
    func updateInformation() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        firstNameLabel.text = registration.firstName
        lastNameLabel.text = registration.lastName
        emailLabel.text = registration.emailAddress
        checkingInDateLabel.text = dateFormatter.string(from: registration.checkInDate)
        checkingOutDateLabel.text = dateFormatter.string(from: registration.checkOutDate)
        adultsNumberLabel.text = String(registration.numberOfAdults)
        childrenNumberLabel.text = String(registration.numberOfChildren)
        wifiLabel.text = String(registration.wifi)
        roomtypeLabel.text = registration.roomType.name
        
        tableView.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
    

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
