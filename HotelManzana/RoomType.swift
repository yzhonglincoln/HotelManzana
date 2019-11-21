//
//  RoomType.swift
//  HotelManzana
//
//  Created by Soft Dev on 10/23/19.
//  Copyright © 2019 Alice Zhong. All rights reserved.
//

import Foundation

// set type: roomtype
struct RoomType: Equatable {
    let id: Int
    let name: String
    let shortName: String
    let price: Int
    
    // example array
    static var all: [RoomType] {
        return [RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
                RoomType(id: 1, name: "One King", shortName: "K", price: 209),
                RoomType(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)]
    }
    
    // allow using binary operator "=="
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
}
