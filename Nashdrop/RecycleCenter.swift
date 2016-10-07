//
//  RecycleCenter.swift
//  Nashdrop
//
//  Created by Paul Kirk Adams on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import Foundation

class RecycleCenter {

    private let govNameKey = "facility_name"
    private let govAddressKey = "mapped_location_address"
    private let govCityKey = "mapped_location_city"
    private let govStateKey = "mapped_location_state"
    private let govZIPKey = "mapped_location_zip"
    private let govAcceptedItemsKey = "acceptedItems"
    private let govPhoneKey = "phone"
    private let govResultsKey = "results"
    private let govLocationKey = "mapped_location"
    private let govCoordinatesKey = "coordinates"
    
    private let customNameKey = "name"
    private let customAddressKey = "address"
    private let customCityKey = "city"
    private let customStateKey = "state"
    private let customZIPKey = "zip"
    private let customAcceptedItemsKey = "acceptedItems"
    private let customResultsKey = "results"
    private let customLatKey = "lat"
    private let customLongKey = "long"

    var name: String?
    var address: String?
    var city: String?
    var state: String?
    var zip: String?
    var phone: String?
    var acceptedItems: String?
    var lat: Double?
    var long: Double?
    
    init(jsonDictionary: [String : AnyObject]) {
    
        if kUseGovAPI {
            self.name = (jsonDictionary[govNameKey] as? String) ?? nil
            self.address = (jsonDictionary[govAddressKey] as? String) ?? nil
            self.city = (jsonDictionary[govCityKey] as? String) ?? nil
            self.state = (jsonDictionary[govStateKey] as? String) ?? nil
            self.zip = (jsonDictionary[govZIPKey] as? String) ?? nil
            self.phone = (jsonDictionary[govPhoneKey] as? String) ?? nil
            
            if let mappedLocation = jsonDictionary[govLocationKey]?[govCoordinatesKey] as? [Double] {
                self.lat = mappedLocation[1]
                self.long = mappedLocation[0]
            }
            
        } else {
            self.name = (jsonDictionary[customNameKey] as? String) ?? nil
            self.address = (jsonDictionary[customAddressKey] as? String) ?? nil
            self.city = (jsonDictionary[customCityKey] as? String) ?? nil
            self.state = (jsonDictionary[customStateKey] as? String) ?? nil
            self.zip = (jsonDictionary[customZIPKey] as? String) ?? nil
            self.lat = (jsonDictionary[customLatKey] as? Double) ?? nil
            self.long = (jsonDictionary[customLongKey] as? Double) ?? nil
        }
    }
}