//
//  ProductItemsProvider.swift
//  justorderstore
//
//  Created by RayRainier on 4/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

class ProductItemsProvider {
    
    static let items = {
        return [
            Product(data:[
                "sku": "1234560" as AnyObject,
                "desc": "Asian Cucumber Salad" as AnyObject,
                "subdesc": "Chicken Flavor" as AnyObject,
                "category": "Noodles" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "asiancucumbersalad")!,
                "qty": 7 as AnyObject,
                "price": 3995 as Int as AnyObject
                ]),
            Product(data:[
                "sku": "2345678" as AnyObject,
                "desc": "Bim Bim Bop" as AnyObject,
                "subdesc": "Beef Flavor" as AnyObject,
                "category": "Noodles" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "bimbimbop")!,
                "qty": 9 as AnyObject,
                "price": 3995 as Int as AnyObject
                ]),
            Product(data:[
                "sku": "1234567" as AnyObject,
                "desc": "Korean Barbeque" as AnyObject,
                "subdesc": "Chicken Flavor" as AnyObject,
                "category": "Grilled" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "koreanbbq")!,
                "qty": 7 as AnyObject,
                "price": 4500 as Int as AnyObject
                ]),
            Product(data:[
                "sku": "2345679" as AnyObject,
                "desc": "Korean Grilled Chicken" as AnyObject,
                "subdesc": "On top of Rice" as AnyObject,
                "category": "Grilled" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "koreanchicken")!,
                "qty": 9 as AnyObject,
                "price": 4500 as Int as AnyObject
                ]),
            //            Product(dictionary:[
            //                "sku": "1234560" as AnyObject,
            //                "desc": "Mongolian Beef" as AnyObject,
            //                "subdesc": "Special Seasoning" as AnyObject,
            //                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
            //                "normalImage": UIImage(named: "mongolianbeef")!,
            //                "qty": 7 as AnyObject,
            //                "price": 100 as AnyObject
            //                ]),
            //            Product(dictionary:[
            //                "sku": "2345678" as AnyObject,
            //                "desc": "Orange Chicken" as AnyObject,
            //                "subdesc": "Tangy Flavor" as AnyObject,
            //                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
            //                "normalImage": UIImage(named: "orangechicken")!,
            //                "qty": 9 as AnyObject,
            //                "price": 100 as AnyObject
            //                ]),
            //            Product(dictionary:[
            //                "sku": "1234567" as AnyObject,
            //                "desc": "Pot Stickers" as AnyObject,
            //                "subdesc": "Chicken Flavor" as AnyObject,
            //                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
            //                "normalImage": UIImage(named: "potstickers")!,
            //                "qty": 7 as AnyObject,
            //                "price": 100 as AnyObject
            //                ]),
            Product(data:[
                "sku": "2345679" as AnyObject,
                "desc": "Shrimp Brocolli" as AnyObject,
                "subdesc": "Stir Fried" as AnyObject,
                "category": "Veggies" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "shrimpbrocolli")!,
                "qty": 9 as AnyObject,
                "price": 1000 as Int as AnyObject
                ]),
            Product(data:[
                "sku": "1234560" as AnyObject,
                "desc": "Vietnamese Spring Rolls" as AnyObject,
                "subdesc": "Shrimp Flavor" as AnyObject,
                "category": "Veggies" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "springrolls")!,
                "qty": 7 as AnyObject,
                "price": 6000 as Int as AnyObject
                ]),
            //            Product(dictionary:[
            //                "sku": "2345678" as AnyObject,
            //                "desc": "Stir Fried Noodles" as AnyObject,
            //                "subdesc": "Beef Flavor" as AnyObject,
            //                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
            //                "normalImage": UIImage(named: "stirfriednoodles")!,
            //                "qty": 9 as AnyObject,
            //                "price": 69 as AnyObject
            //                ]),
            //            Product(dictionary:[
            //                "sku": "1234567" as AnyObject,
            //                "desc": "Chef's Summer Rolls" as AnyObject,
            //                "subdesc": "Special Flavor" as AnyObject,
            //                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
            //                "normalImage": UIImage(named: "summerrolls")!,
            //                "qty": 7 as AnyObject,
            //                "price": 69 as AnyObject
            //                ]),
            Product(data:[
                "sku": "2345679" as AnyObject,
                "desc": "Thai Curry Soup" as AnyObject,
                "subdesc": "Beef Flavor" as AnyObject,
                "category": "HotFood" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImage": UIImage(named: "thaicurrysoup")!,
                "qty": 9 as AnyObject,
                "price": 6000 as Int as AnyObject
                ])
        ]
    }()
    
}


