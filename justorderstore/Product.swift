//
//  Product.swift
//  justorderstore
//
//  Created by RayRainier on 4/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

class Product: NSObject {
    
    var sku: String?
    var desc: String?
    var subdesc: String?
    var category: String?
    var timestamp: NSNumber?
    var normalImage: UIImage?
    var qty: Int?
    var price: Int?
    
    /*
     Introduce new init() to avoid crashing due to adding props
     */
    init(dictionary: [String: AnyObject]) {
        super.init()
        
        sku = dictionary["sku"] as? String
        desc = dictionary["desc"] as? String
        subdesc = dictionary["subdesc"] as? String
        category = dictionary["category"] as? String
        timestamp = dictionary["timestamp"] as? NSNumber
        normalImage = dictionary["normalImage"] as? UIImage
        qty = dictionary["qty"] as? Int
        price = dictionary["price"] as? Int
        
    }
    
}


