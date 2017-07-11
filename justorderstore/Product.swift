//
//  Product.swift
//  justorderstore
//
//  Created by RayRainier on 4/25/17.		Updated 06/18/17
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

class Product: NSObject {
    
	var key: String?
    var sku: String?
    var desc: String?
    var subdesc: String?
    var category: String?
    var timestamp: NSNumber?
    var normalImageURL: String?
    var price1: Int?
    var price2: Int?
    var price3: Int?
    var extendedtext: String?
    var active: Int?
    var storeID: String?
    
    /*
     Introduce new init() to avoid crashing due to adding props
     key: -Kmadfoipuo12ldflkj
     active:     1
     category:     "Noodles"
     desc:     "Asian Cucumber Salad"
     extendedtext:     "This is extended text for admin user to describ..."
     normalImageURL:     "https://firebasestorage.googleapis.com/v0/b/sta..."
     price1: 999
     price2: 999
     price3: 999
     sku:     "7C9F3CD9-39A3-4E85-BB9D-0A597726B379"
     storeID:     "iLCtXp27p4WL5vaVirCIwW8Eprt2"
     subdesc:      "Chicken Flavor"
     timestamp:      1496877353.031771
     
     */
    
    
    
    init(data: [String: AnyObject]) {
        super.init()
        
        key = data["key"] as? String
        sku = data["sku"] as? String
        desc = data["desc"] as? String
        subdesc = data["subdesc"] as? String
        category = data["category"] as? String
        timestamp = data["timestamp"] as? NSNumber
        normalImageURL = data["normalImageURL"] as? String
        price1 = data["price1"] as? Int
        price2 = data["price2"] as? Int
        price3 = data["price3"] as? Int
        extendedtext = data["extendedtext"] as? String
        active = data["active"] as? Int
        storeID = data["storeID"] as? String
        
    }
}



