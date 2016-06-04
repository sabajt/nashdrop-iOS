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
    
    private let baseURLString = "http://nashdrop.herokuapp.com/search/"
    
    func getCenters(material: String?, completion: (errorMessage: String?, json: [[String: AnyObject]]?) -> Void) {
        
        var urlString = baseURLString
        if let m = material {
            urlString += m
        }
        
        Alamofire.request(.GET, urlString, parameters: nil).validate().responseJSON { response in

            if response.result.isFailure {
                let message = self.errorMessageFromResponse(response)
                print("failure message: \(message)")
                completion(errorMessage: message, json: nil)
                return
            }
            
            guard let data = response.result.value as? [[String: AnyObject]] else {
                print("failure")
                return
            }
            
            completion(errorMessage: nil, json: data)
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
