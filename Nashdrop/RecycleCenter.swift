//
//  RecycleCenter.swift
//  Nashdrop
//
//  Created by Paul Kirk Adams on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import Foundation

class RecycleCenter {

    static let kNameKey = "name"
    static let kPhoneKey = "phone"
    static let kStreetKey = "street"
    static let kCityKey = "city"
    static let kStateKey = "state"
    static let kZIPKey = "zip"
    static let kAcceptedItemsKey = "acceptedItems"
    static let kResultsKey = "results"

    var name: String?
    var phone: String?
    var zip: String?
    var street: String?
    var city: String?
    var state: String?
    var acceptedItems: String?

    init(jsonDictionary: [String: String]) {
        self.name = jsonDictionary[RecycleCenter.kNameKey]
        self.phone = jsonDictionary[RecycleCenter.kPhoneKey]
        self.street = jsonDictionary[RecycleCenter.kStreetKey]
        self.city = jsonDictionary[RecycleCenter.kCityKey]
        self.state = jsonDictionary[RecycleCenter.kStateKey]
        self.zip = jsonDictionary[RecycleCenter.kZIPKey]
        self.acceptedItems = jsonDictionary[RecycleCenter.kAcceptedItemsKey]
    }
}