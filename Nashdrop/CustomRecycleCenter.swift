//
//  CustomRecycleCenter.swift
//  Nashdrop
//
//  Created by Paul Kirk Adams on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import Foundation

class CustomRecycleCenter {
    
    static let kNameKey = "name"
    static let kAddressKey = "address"
    static let kCityKey = "city"
    static let kStateKey = "state"
    static let kZIPKey = "zip"
    static let kAcceptedItemsKey = "acceptedItems"
    static let kResultsKey = "results"
    static let kLatKey = "lat"
    static let kLongKey = "long"
    
    var name: String?
    var address: String?
    var city: String?
    var state: String?
    var zip: String?
    var acceptedItems: String?
    var lat: String?
    var long: String?
    
    init(jsonDictionary: [String : AnyObject]) {
        if let name = jsonDictionary[CustomRecycleCenter.kNameKey] as? String {
            self.name = name
        }
        if let address = jsonDictionary[CustomRecycleCenter.kAddressKey] as? String {
            self.address = address
        }
        if let city = jsonDictionary[CustomRecycleCenter.kCityKey] as? String {
            self.city = city
        }
        if let state = jsonDictionary[CustomRecycleCenter.kStateKey] as? String {
            self.state = state
        }
        if let zip = jsonDictionary[CustomRecycleCenter.kZIPKey] as? String {
            self.zip = zip
        }
        if let lat = jsonDictionary[CustomRecycleCenter.kLatKey] as? String {
            self.lat = lat
        }
        if let long = jsonDictionary[CustomRecycleCenter.kLongKey] as? String {
            self.long = long
        }
    }
}