//
//  API.swift
//  Turkcell Challenge
//
//  Created by Efe Helvacı on 24.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import Alamofire

protocol APIEndpointType {
    
    var baseURL : String { get }
    var headers: [String : String]? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var params: [String : Any] { get }
    var encoding: ParameterEncoding { get }
    
}

enum API {
    
    case products
    
    case productDetail(id: String)
    
}

extension API: APIEndpointType {
    
    var baseURL : String {
        return "https://s3-eu-west-1.amazonaws.com/developer-application-test/"
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var path: String {
        switch self {
        case .products:                 return baseURL + "cart/list"
        case .productDetail(let id):    return baseURL + "cart/\(id)/detail"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .products,
             .productDetail:
            return .get
        }
    }
    
    var params: [String : Any] {
        return [:]
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.methodDependent
    }
    
}
