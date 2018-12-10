//
//  RequestClient.swift
//  httprequest
//
//  Created by Michael James on 12/9/18.
//  Copyright © 2018 Michael James. All rights reserved.
//

import Foundation
import Alamofire

class RequestClient {

    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void

    func execute(_ url: URL, completion: @escaping WebServiceResponse) {
        
        AF.request(url).validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let jsonArray = response.result.value as? [[String: Any]] {
                completion(jsonArray, nil)
            } else if let jsonDict = response.result.value as? [String: Any] {
                completion([jsonDict], nil)
            }
        }
    }
}
