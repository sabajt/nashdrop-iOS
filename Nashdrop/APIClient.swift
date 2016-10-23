//
//  APIClient.swift
//  Nashdrop
//
//  Created by John Saba on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import Foundation

class APIClient {

    static let sharedInstance = APIClient()
    
    private let appTokenField = "$$app_token"
    private let appToken = "SdrO1c71wKZPDVbTsomCAiv8H"
    private let baseURLString = "https://data.nashville.gov/resource/9d2e-48mm"
    
    func validateJsonPayload(data: NSData?, response: NSURLResponse?, error: NSError?) -> (json: AnyObject?, errorMessage: String?) {
        
        guard error == nil else {
            return (nil, "Error: \(error.debugDescription)")
        }
        guard let response = response as? NSHTTPURLResponse else {
            return (nil, "No URL Response")
        }
        guard case 200...299 = response.statusCode else {
            return (nil, "Invalid Response Code: \(response.statusCode)")
        }
        guard let data = data else {
            return (nil, "No Data");
        }
        guard let json = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as! [[String: AnyObject]] else {
            return (nil, "Unexpected Data Format")
        }
        return (json, nil)
    }
    
    func getCenters(material: String?, completion: (json: [[String: AnyObject]]?, errorMessage: String?) -> Void) {
        
        let urlString = baseURLString
        var params = [appTokenField: appToken]
        
        if let m = material {
            params[m] = "Y"
            if m == "residential_furniture_appliances" || m == "residential_trash" || m == "household_hazardous_waste" {
                params[m] = "Y**"
            }
        }
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        session.dataTaskWithURL(NSURL(string: urlString)!) { (data, response, error) in
            
            let (json, errorMessage) = self.validateJsonPayload(data, response: response, error: error)
            
            dispatch_async(dispatch_get_main_queue(), {
                guard let centers = json as? [[String: AnyObject]] else {
                    let message = errorMessage ?? "Unexpected Data Format"
                    completion(json: nil, errorMessage: message)
                    return
                }
                completion(json: centers, errorMessage: nil)
            })
        }.resume()
    }
}
