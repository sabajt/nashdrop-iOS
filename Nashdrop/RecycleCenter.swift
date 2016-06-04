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

    init(jsonDictionary: [String : AnyObject]) {
    
        if let name = jsonDictionary[RecycleCenter.kNameKey] as? String {
            self.name = name
        }
        
        if let address = jsonDictionary[RecycleCenter.kAddressKey] as? String {
            self.address = address
        }
        
        if let city = jsonDictionary[RecycleCenter.kCityKey] as? String {
            self.city = city
        }
        
        if let state = jsonDictionary[RecycleCenter.kStateKey] as? String {
            self.state = state
        }
        
        if let zip = jsonDictionary[RecycleCenter.kZIPKey] as? String {
            self.zip = zip
        }
        
        if let phone = jsonDictionary[RecycleCenter.kPhoneKey] as? String {
            self.phone = phone
        }
        
        
//        self.name = jsonDictionary[RecycleCenter.kNameKey]
//        self.address = jsonDictionary[RecycleCenter.kAddressKey]
//        self.city = jsonDictionary[RecycleCenter.kCityKey]
//        self.state = jsonDictionary[RecycleCenter.kStateKey]
//        self.zip = jsonDictionary[RecycleCenter.kZIPKey]
//        self.phone = jsonDictionary[RecycleCenter.kPhoneKey]
//        self.acceptedItems = jsonDictionary[RecycleCenter.kAcceptedItemsKey]
    }
}