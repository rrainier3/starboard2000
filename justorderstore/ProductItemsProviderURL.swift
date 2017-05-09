//
//  ProductItemsProviderURL.swift
//  justorderstore
//
//  Created by RayRainier on 5/6/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

class ProductItemsProviderURL {
    
    static let items = {
        return [
            Product(dictionary:[
                "sku": "1234560" as AnyObject,
                "desc": "Asian Cucumber Salad" as AnyObject,
                "subdesc": "Chicken Flavor" as AnyObject,
                "category": "Noodles" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "asiancucumbersalad" as AnyObject,
                "qty": 7 as AnyObject,
                "price": 3995 as Int as AnyObject
                ]),
            Product(dictionary:[
                "sku": "2345678" as AnyObject,
                "desc": "Bim Bim Bop" as AnyObject,
                "subdesc": "Beef Flavor" as AnyObject,
                "category": "Noodles" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "bimbimbop" as AnyObject,
                "qty": 9 as AnyObject,
                "price": 3995 as Int as AnyObject
                ]),
            Product(dictionary:[
                "sku": "1234567" as AnyObject,
                "desc": "Korean Barbeque" as AnyObject,
                "subdesc": "Chicken Flavor" as AnyObject,
                "category": "Grilled" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "koreanbbq" as AnyObject,
                "qty": 7 as AnyObject,
                "price": 4500 as Int as AnyObject
                ]),
            Product(dictionary:[
                "sku": "2345679" as AnyObject,
                "desc": "Korean Grilled Chicken" as AnyObject,
                "subdesc": "On top of Rice" as AnyObject,
                "category": "Grilled" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "koreanchicken" as AnyObject,
                "qty": 9 as AnyObject,
                "price": 4500 as Int as AnyObject
                ]),
            Product(dictionary:[
                "sku": "1234560" as AnyObject,
                "desc": "Mongolian Beef" as AnyObject,
                "subdesc": "Special Seasoning" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "mongolianbeef" as AnyObject,
                "qty": 7 as AnyObject,
                "price": 1000 as AnyObject
                ]),
            Product(dictionary:[
                "sku": "2345678" as AnyObject,
                "desc": "Orange Chicken" as AnyObject,
                "subdesc": "Tangy Flavor" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "orangechicken" as AnyObject,
                "qty": 9 as AnyObject,
                "price": 1000 as AnyObject
                ]),
//            Product(dictionary:[
//                "sku": "1234567" as AnyObject,
//                "desc": "Pot Stickers" as AnyObject,
//                "subdesc": "Chicken Flavor" as AnyObject,
//                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
//                "normalImageURL": "potstickers" as AnyObject,
//                "qty": 7 as AnyObject,
//                "price": 3995 as AnyObject
//                ]),
//            Product(dictionary:[
//                "sku": "2345679" as AnyObject,
//                "desc": "Shrimp Brocolli" as AnyObject,
//                "subdesc": "Stir Fried" as AnyObject,
//                "category": "Veggies" as AnyObject,
//                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
//                "normalImageURL": "shrimpbrocolli" as AnyObject,
//                "qty": 9 as AnyObject,
//                "price": 3995 as Int as AnyObject
//                ]),
//            Product(dictionary:[
//                "sku": "1234560" as AnyObject,
//                "desc": "Vietnamese Spring Rolls" as AnyObject,
//                "subdesc": "Shrimp Flavor" as AnyObject,
//                "category": "Veggies" as AnyObject,
//                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
//                "normalImageURL": "springrolls" as AnyObject,
//                "qty": 7 as AnyObject,
//                "price": 6000 as Int as AnyObject
//                ]),
//            Product(dictionary:[
//                "sku": "2345678" as AnyObject,
//                "desc": "Stir Fried Noodles" as AnyObject,
//                "subdesc": "Beef Flavor" as AnyObject,
//                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
//                "normalImageURL": "stirfriednoodles" as AnyObject,
//                "qty": 9 as AnyObject,
//                "price": 4500 as AnyObject
//                ]),
//            Product(dictionary:[
//                "sku": "1234567" as AnyObject,
//                "desc": "Chef's Summer Rolls" as AnyObject,
//                "subdesc": "Special Flavor" as AnyObject,
//                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
//                "normalImageURL": "summerrolls" as AnyObject,
//                "qty": 7 as AnyObject,
//                "price": 4500 as AnyObject
//                ]),
            Product(dictionary:[
                "sku": "2345679" as AnyObject,
                "desc": "Thai Curry Soup" as AnyObject,
                "subdesc": "Beef Flavor" as AnyObject,
                "category": "HotFood" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "thaicurrysoup" as AnyObject,
                "qty": 9 as AnyObject,
                "price": 6000 as Int as AnyObject
                ])
        ]
    }()
    
}

