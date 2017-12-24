//
//  Product.swift
//  Turkcell Challenge
//
//  Created by Efe Helvacı on 24.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import SwiftyJSON

class Product: NSObject, NSCoding {
    var id:    String?
    var name:  String?
    var price: Int?
    var image: String?
    
    override init() {}
    
    init(json: JSON) {
        self.id     = json["product_id"].string
        self.name   = json["name"].string
        self.price  = json["price"].int
        self.image  = json["image"].string
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(image, forKey: "image")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? String ?? ""
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.price = aDecoder.decodeObject(forKey: "price") as? Int ?? 0
        self.image = aDecoder.decodeObject(forKey: "image") as? String ?? ""
    }
    
}

extension Product {
    class func initArray(jsonArray: [JSON]?) -> [Product] {
        
        var productArray = [Product]()
        
        guard let jsonArray = jsonArray else { return productArray }
        
        for json in jsonArray {
            productArray.append(Product(json: json))
        }
        
        return productArray
    }
}
