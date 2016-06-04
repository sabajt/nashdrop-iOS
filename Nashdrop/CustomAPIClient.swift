//
//  APIClient.swift
//  Nashdrop
//
//  Created by John Saba on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import Alamofire

class CustomAPIClient {
    
    
    static let sharedInstance = CustomAPIClient()
    
//    private let appTokenField = "$$app_token"
//    private let appToken = "SdrO1c71wKZPDVbTsomCAiv8H"
    private let baseURLString = "http://nashdrop.herokuapp.com/search/"
    
    func getCenters(material: String?, completion: (errorMessage: String?, json: [[String: AnyObject]]?) -> Void) {
        
        let urlString = baseURLString
//        var params = [appTokenField: appToken]
        
//        if let m = material {
//            params[m] = "Y"
//            
//            if m == "residential_furniture_appliances" || m == "residential_trash" || m == "household_hazardous_waste" {
//                params[m] = "Y**"
//            }
//        }
        
//        Alamofire.request(.GET, urlString, parameters: params).validate().responseJSON { response in
        Alamofire.request(.GET, urlString, parameters: nil).validate().responseJSON { response in

            if response.result.isFailure {
                let message = self.errorMessageFromResponse(response)
                print("failure message: \(message)")
                completion(errorMessage: message, json: nil)
                return
            }
            
//            guard let data = response.result.value as? [[String: AnyObject]] else {
//                print("failure")
//                return
//            }
            
            print(response)
            
            completion(errorMessage: nil, json: [["stuff" : "things"]])
        }
    }
    
    func errorMessageFromResponse(response: Response<AnyObject, NSError>) -> String {
        var errorMessage = "Failure: "
        if let urlResponse = response.response {
            errorMessage += "\(urlResponse.statusCode)"
        } else {
            errorMessage += "Unknown Error"
        }
        return errorMessage
    }
}
