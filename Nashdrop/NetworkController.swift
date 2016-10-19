//
//  NetworkController.swift
//  Nashdrop
//
//  Created by Paul Kirk Adams on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import Foundation

class NetworkController: NSObject {

    static let baseURLString = "http://xxxxxx.gov"

    static func searchURLByRecycleCenters(acceptedItems: String) -> NSURL {
        return NSURL(string: NetworkController.baseURLString + "/getall_recycleCenters_acceptedItems.php?recycleCenters=\(acceptedItems)&output=json")!
    }

    static func dataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            guard let data = data  else {
                print(error?.localizedDescription)
                completion(resultData: nil)
                return
            }
            completion(resultData: data)
        }
        dataTask.resume()
    }
}
