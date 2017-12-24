//
//  NetworkManager.swift
//  Turkcell Challenge
//
//  Created by Efe Helvacı on 24.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import Alamofire
import SwiftyJSON

class NetworkManager {
    
    typealias RequestCompletionClosure = (Bool, JSON?) -> Void
    
    class func request(forEndpoint endpoint: API, completion: @escaping RequestCompletionClosure ) -> Void {
        // TODO Alamofire Request
    }
    
}
