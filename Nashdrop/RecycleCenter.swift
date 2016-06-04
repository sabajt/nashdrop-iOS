//
//  RecycleCenter.swift
//  Nashdrop
//
//  Created by Paul Kirk Adams on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import Foundation

class RecycleCenter {

    static let kNameKey = "facility_name"
    static let kAddressKey = "mapped_location_address"
    static let kCityKey = "mapped_location_city"
    static let kStateKey = "mapped_location_state"
    static let kZIPKey = "mapped_location_zip"
    static let kAcceptedItemsKey = "acceptedItems"
    static let kPhoneKey = "phone"
    static let kResultsKey = "results"

    var name: String?
    var address: String?
    var city: String?
    var state: String?
    var zip: String?
    var phone: String?
    var acceptedItems: String?

    init(jsonDictionary: [String: String]) {
        self.name = jsonDictionary[RecycleCenter.kNameKey]
        self.address = jsonDictionary[RecycleCenter.kAddressKey]
        self.city = jsonDictionary[RecycleCenter.kCityKey]
        self.state = jsonDictionary[RecycleCenter.kStateKey]
        self.zip = jsonDictionary[RecycleCenter.kZIPKey]
        self.phone = jsonDictionary[RecycleCenter.kPhoneKey]
//        self.acceptedItems = jsonDictionary[RecycleCenter.kAcceptedItemsKey]
    }
}