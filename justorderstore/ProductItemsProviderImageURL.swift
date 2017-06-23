//
//  ProductItemsProviderImageURL.swift
//  justorderstore
//
//  Created by RayRainier on 6/18/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

class ProductItemsProviderImageURL {
    
    static let items = {
        return [
            Product(data:[
                "sku": "1234560" as AnyObject,
                "desc": "Asian Cucumber Salad" as AnyObject,
                "subdesc": "Chicken Flavor" as AnyObject,
                "category": "Noodles" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "asiancucumbersalad" as AnyObject,
                "qty": 7 as AnyObject,
                "price": 3995 as AnyObject,
                "extendedtext": "This is extended text for admin user to describe product further" as AnyObject,
                "active": 1 as AnyObject
                ]),
            Product(data:[
                "sku": "2345678" as AnyObject,
                "desc": "Bim Bim Bop" as AnyObject,
                "subdesc": "Beef Flavor" as AnyObject,
                "category": "Noodles" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "bimbimbop" as AnyObject,
                "qty": 9 as AnyObject,
                "price": 3995 as AnyObject,
                "extendedtext": "This is extended text for admin user to describe product further" as AnyObject,
                "active": 1 as AnyObject
                
                ]),
            Product(data:[
                "sku": "1234567" as AnyObject,
                "desc": "Korean Barbeque" as AnyObject,
                "subdesc": "Chicken Flavor" as AnyObject,
                "category": "Grilled" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "koreanbbq" as AnyObject,
                "qty": 7 as AnyObject,
                "price": 4500 as AnyObject,
                "extendedtext": "This is extended text for admin user to describe product further" as AnyObject,
                "active": 1 as AnyObject
                ]),
            Product(data:[
                "sku": "2345679" as AnyObject,
                "desc": "Korean Grilled Chicken" as AnyObject,
                "subdesc": "On top of Rice" as AnyObject,
                "category": "Grilled" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "koreanchicken" as AnyObject,
                "qty": 9 as AnyObject,
                "price": 4500 as AnyObject,
                "extendedtext": "This is extended text for admin user to describe product further" as AnyObject,
                "active": 1 as AnyObject
                
                ]),
            Product(data:[
                "sku": "1234560" as AnyObject,
                "desc": "Mongolian Beef" as AnyObject,
                "subdesc": "Special Seasoning" as AnyObject,
                "category": "HotFood" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "mongolianbeef" as AnyObject,
                "qty": 7 as AnyObject,
                "price": 1000 as AnyObject,
                "extendedtext": "This is extended text for admin user to describe product further" as AnyObject,
                "active": 1 as AnyObject
                
                ]),
            Product(data:[
                "sku": "2345678" as AnyObject,
                "desc": "Orange Chicken" as AnyObject,
                "subdesc": "Tangy Flavor" as AnyObject,
                "category": "Grilled" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "orangechicken" as AnyObject,
                "qty": 9 as AnyObject,
                "price": 1000 as AnyObject,
                "extendedtext": "This is extended text for admin user to describe product further" as AnyObject,
                "active": 1 as AnyObject
                
                ]),
            Product(data:[
                "sku": "2345679" as AnyObject,
                "desc": "Thai Curry Soup" as AnyObject,
                "subdesc": "Beef Flavor" as AnyObject,
                "category": "HotFood" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "thaicurrysoup" as AnyObject,
                "qty": 9 as AnyObject,
                "price": 6000 as AnyObject,
                "extendedtext": "This is extended text for admin user to describe product further" as AnyObject,
                "active": 1 as AnyObject
                
                ])
        ]
    }()
    
}


