//
//  RecycleCenterController.swift
//  Nashdrop
//
//  Created by Paul Kirk Adams on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import Foundation

class RecycleCenterController {

    static func searchRecycleCentersByAcceptedItems(recycleCenter: String, completion: (recycleCenters: [RecycleCenter]) -> Void) {
        let url = NetworkController.searchURLByRecycleCenters(<#T##acceptedItems: String##String#>)
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            guard let recycleCenterData = resultData  else {
                print("NO DATA RETURNED")
                completion(recycleCenters: [])
                return
            }
            do {
                let resultsDictionary = try NSJSONSerialization.JSONObjectWithData(recycleCenterData, options: NSJSONReadingOptions.AllowFragments) as! [String : AnyObject]
                let recycleCenterDictionaries = resultsDictionary[RecycleCenter.kResultsKey] as! [[String: String]]
                var arrayOfRecycleCenterModelObjects: [RecycleCenter] = []
                for dictionary in recycleCenterDictionaries {
                    let ctr = RecycleCenter(jsonDictionary: dictionary)
                    arrayOfRecycleCenterModelObjects.append(ctr)
                }
                completion(recycleCenters: arrayOfRecycleCenterModelObjects)
            } catch {
                print("Error serializing JSON")
                completion(recycleCenters: [])
                return
            }
        }
    }
}