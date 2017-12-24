//
//  NetworkManager.swift
//  Turkcell Challenge
//
//  Created by Efe Helvacı on 24.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import Alamofire
import SwiftyJSON

class NetworkManager: SessionDelegate {
    
    static var manager: SessionManager = {
        let config = URLSessionConfiguration.default
        
        let networkManager = NetworkManager()
        
        let manager = Alamofire.SessionManager(configuration: config, delegate: networkManager, serverTrustPolicyManager: nil)
        
        return manager
    }()
    
    typealias RequestCompletionClosure = (Bool, JSON?) -> Void
    
    class func request(forEndpoint endpoint: API, completion: @escaping RequestCompletionClosure ) -> Void {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        manager.request(endpoint.path,
                        method: endpoint.method,
                        parameters: endpoint.params,
                        encoding: endpoint.encoding,
                        headers: endpoint.headers)
            .validate(statusCode: 200...299)
            .responseJSON { (response) in
                
                #if DEBUG
                    debugPrint(response)
                #endif
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                switch response.result{
                case .success:
                    
                    let json = JSON(data: response.data!)
                    
                    completion(true, json)
                    
                    return
                case .failure:
                    
                    // TODO Improvement, send relevant status code instead of success boolean
                    completion(false, nil)
                    
                    return
                }
        }
    }
    
}
