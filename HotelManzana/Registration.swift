//
//  Registration.swift
//  HotelManzana
//
//  Created by Soft Dev on 10/25/19.
//  Copyright © 2019 Alice Zhong. All rights reserved.
//

import Foundation
import UIKit

// set type : registration
struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    var wifi: Bool
    var roomType: RoomType
}
