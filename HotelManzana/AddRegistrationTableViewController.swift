//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Soft Dev on 10/8/19.
//  Copyright © 2019 Alice Zhong. All rights reserved.
//

import UIKit

// conform to the custom protocol
class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {

    // implement the required method
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // initialize date pickers
        updateDateViews()
        
        // give check in date a minimum value
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        // set up the number of guests label correctly on the first load
        updateNumberOfGuests()
        
        // update the room type label when first load
        updateRoomType()
        
        // disable the done button
        doneButton.isEnabled = false
        
    }
    
    // outlets for three information text fields and done button
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    /*
    // action for done button
    @IBAction func doneBarButtonTapped(_ sender: Any) {
        // pass information
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        let roomChoice = roomType?.name ?? "Not Set"
        
        // print to console
        print("DONE TAPPED")
        print("firstName: \(firstName)")
        print("lastName: \(lastName)")
        print("email: \(email)")
        print("checkIn: \(checkInDate)")
        print("checkOut: \(checkOutDate)")
        print("numberOfAdults: \(numberOfAdults)")
        print("numberOfChildren: \(numberOfChildren)")
        print("wifi: \(hasWifi)")
        print("roomType: \(roomChoice)")
    }
    */
    
    // outlets for check-in and check-out date label and date picker
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    // function for update date label
    func updateDateViews() {
        // give check out date a minimum value
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
        
        // set date label style
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        // set date label
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    // action for date pickers
    @IBAction func datePickerValueChanged(_ sender: Any) {
        updateDateViews()
    }
    
    // variables which track the state of the views
    // store index path of the date pickers
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    // store index path of the date labels
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    // store whether or not the date picker will be shown, start as not shown
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    // set row's height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // check if the index path is equal to one of the date picker cells
        switch indexPath {
        // check if the check in date picker is displayed then show height accordingly
        case checkInDatePickerCellIndexPath:
            if isCheckInDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        // check if the check out date picker is displayed then show height accordingly
        case checkOutDatePickerCellIndexPath:
            if isCheckOutDatePickerShown{
                return 216.0
            } else {
                return 0.0
            }
        // other cells' height
        default:
            return 44.0
        }
    }
    
    // show and hide date pickers
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // remove the gray highlight after tapped
        tableView.deselectRow(at: indexPath, animated: true)
        
        // determine which date label cell is tapped and respond accordingly
        switch indexPath {
        // if check in date label is tapped
        case checkInDateLabelCellIndexPath:
            // if check in date picker is shown already
            if isCheckInDatePickerShown {
                // hide check in date picker
                isCheckInDatePickerShown = false
            }
            // if check out date picker is shown
            else if isCheckOutDatePickerShown {
                // hide check out date picker and show check in date picker
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            }
            // if no date pickers is shown
            else {
                // show check in date picker
                isCheckInDatePickerShown = true
            }
            // update table view
            tableView.beginUpdates()
            tableView.endUpdates()
        // if check out date label is tapped
        case checkOutDateLabelCellIndexPath:
            // if check out date picker is shown already
            if isCheckOutDatePickerShown {
                // hide check out date picker
                isCheckOutDatePickerShown = false
            }
            // if check in date picker is shown
            else if isCheckInDatePickerShown {
                // hide check in date picker and show check out date picker
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            }
            // if no date pickers is shown
            else {
                // show check out date picker
                isCheckOutDatePickerShown = true
            }
            // update table view
            tableView.beginUpdates()
            tableView.endUpdates()
        // if any other row is tapped
        default:
            // do nothing
            break
        }
    }
    
    // Outlets for number of guests label and stepper
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    // update the number of guests label as stepper value changes
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    // respond to a stepper value change
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    // outlet for wifi switch
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    // when wifi switch changed
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
    }
    
    // outlet for room type detail label
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    // a property which hold the selected room type
    var roomType: RoomType?
    
    // fuction which update the room type label
    func updateRoomType() {
        // unwarp
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
            // enable done button
            doneButton.isEnabled = true
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    // when room type cell tapped
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType" {
            let destinationViewController = segue.destination as? SelectRoomTypeTableViewController
            destinationViewController?.delegate = self
            destinationViewController?.roomType = roomType
        }
    }
    
    // a property which hold all inputted data
    var registration: Registration? {
        
        guard let roomType = roomType else { return nil }
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(firstName: firstName,
                            lastName: lastName,
                            emailAddress: email,
                            checkInDate: checkInDate,
                            checkOutDate: checkOutDate,
                            numberOfAdults: numberOfAdults,
                            numberOfChildren: numberOfChildren,
                            wifi: hasWifi,
                            roomType: roomType)
    }
    
    // action for when cancel button is tapped
    @IBAction func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    

    
    
    
    
    

    // MARK: - Table view data source

    // override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // return 0
    // }

    // override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return 0
    // }

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
}
