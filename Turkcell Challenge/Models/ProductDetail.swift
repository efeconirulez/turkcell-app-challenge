//
//  ProductDetail.swift
//  Turkcell Challenge
//
//  Created by Efe Helvacı on 24.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import SwiftyJSON

class ProductDetail: Product {
    var desc: String?
    
    override init(json: JSON) {
        self.desc = json["description"].string
        
        super.init(json: json)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        
        aCoder.encode(desc, forKey: "description")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.desc = aDecoder.decodeObject(forKey: "description") as? String ?? ""
    }
}
