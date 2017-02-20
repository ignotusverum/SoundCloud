//
//  NetworkingManager.swift
//  SoundCloud
//
//  Created by Vladislav Zagorodnyuk on 2/20/17.
//  Copyright © 2017 VZ. All rights reserved.
//

import Alamofire
import PromiseKit
import SwiftyJSON

let hostName = "api.soundcloud.com"

class NetworkingManager: NSObject {
    
    fileprivate var isHeaderSet = false
    
    var headers = [
        
        "Content-Type": "application/json",
    ]
    
    static let shared = NetworkingManager()
    
    let manager = Alamofire.SessionManager.default
    
    func configureHTTPHeader() {
        
        headers["Authorization"] = "client_id=aa45989bb0c262788e2d11f1ea041b65"
    }
    
    var baseUrl: String {
        
        return "http://\(hostName)"
    }
    
    func URLWithPath(path: String)-> URL {
        
        let urlResult = URL(string: URLString(path: path))
        if let urlResult = urlResult {
            
            return urlResult
        }
        
        return URL(string: baseUrl)!
    }
    
    func URLString(path: String)-> String {
        
        return "\(baseUrl)/\(path)"
    }
    
    // Promise Requests
    func request(_ method: HTTPMethod, path URLString: String, parameters: [String: Any]? = nil) -> Promise<JSON> {
        
        configureHTTPHeader()
        
        return Promise { fulfill, reject in
            
            manager.request(URLWithPath(path: URLString), method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .validate()
                .responseJSON { response in
                    
                    switch response.result {
                        
                    case .success:
                        if let value = response.result.value {
                            let json = JSON(value)
                            fulfill(json)
                        }
                        
                    case .failure(let error):
                        
                        reject(error)
                    }
            }
        }
    }
}
