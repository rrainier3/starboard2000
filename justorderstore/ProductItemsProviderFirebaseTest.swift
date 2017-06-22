//
//  ProductItemsProviderFirebaseTest.swift
//  justorderstore
//
//  Created by RayRainier on 6/22/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//


import UIKit

class ProductItemsProviderFirebaseTest {
    
    static let items = {
        return [
            Product(data:[
                "sku": "1234560" as AnyObject,
                "desc": "Asian Cucumber Salad" as AnyObject,
                "subdesc": "Chicken Flavor" as AnyObject,
                "category": "Noodles" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "https://firebasestorage.googleapis.com/v0/b/starboard-fbfd1.appspot.com/o/iLCtXp27p4WL5vaVirCIwW8Eprt2%2F-KkmCrMjYzgbd41PWfsk.jpg?alt=media&token=342ac849-0b57-4465-a036-ecf8bc1bf40d" as AnyObject,
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
                "normalImageURL": "https://firebasestorage.googleapis.com/v0/b/starboard-fbfd1.appspot.com/o/iLCtXp27p4WL5vaVirCIwW8Eprt2%2F-KkmDlyUWlyihTUJ4YZl.jpg?alt=media&token=d90e8a0c-3fc1-455d-a16e-671824085b31" as AnyObject,
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
                "normalImageURL": "https://firebasestorage.googleapis.com/v0/b/starboard-fbfd1.appspot.com/o/iLCtXp27p4WL5vaVirCIwW8Eprt2%2F-Km3nv5F_wKrXS2d90cL.jpg?alt=media&token=131be610-ace4-4553-9736-0d2136df920a" as AnyObject,
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
                "normalImageURL": "https://firebasestorage.googleapis.com/v0/b/starboard-fbfd1.appspot.com/o/iLCtXp27p4WL5vaVirCIwW8Eprt2%2F-Km3p_UaF32mrJ1ilTLV.jpg?alt=media&token=5800393c-8799-4a91-8b48-373c369cf1b3" as AnyObject,
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
                "normalImageURL": "https://firebasestorage.googleapis.com/v0/b/starboard-fbfd1.appspot.com/o/iLCtXp27p4WL5vaVirCIwW8Eprt2%2F-Km3pjfsyAUcIR3BOUY2.jpg?alt=media&token=771c8bd9-f052-488a-85ae-53e35448f700" as AnyObject,
                "qty": 7 as AnyObject,
                "price": 1000 as AnyObject,
                "extendedtext": "This is extended text for admin user to describe product further" as AnyObject,
                "active": 1 as AnyObject
                
                ]),
            Product(data:[
                "sku": "2345678" as AnyObject,
                "desc": "Orange Chicken" as AnyObject,
                "subdesc": "Tangy Flavor" as AnyObject,
                "category": "Veggies" as AnyObject,
                "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
                "normalImageURL": "https://firebasestorage.googleapis.com/v0/b/starboard-fbfd1.appspot.com/o/iLCtXp27p4WL5vaVirCIwW8Eprt2%2F-Km3pUt9CqqnXr6uhsT2.jpg?alt=media&token=8c9b5da2-1998-42c5-9fdf-58d653a8df57" as AnyObject,
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
                "normalImageURL": "https://firebasestorage.googleapis.com/v0/b/starboard-fbfd1.appspot.com/o/iLCtXp27p4WL5vaVirCIwW8Eprt2%2F-Km3pwVl6kyStoEgoqja.jpg?alt=media&token=4c6ef6c0-791b-42ec-96a6-14b1ed68e785" as AnyObject,
                "qty": 9 as AnyObject,
                "price": 6000 as AnyObject,
                "extendedtext": "This is extended text for admin user to describe product further" as AnyObject,
                "active": 1 as AnyObject
                
                ])
        ]
    }()
    
}



