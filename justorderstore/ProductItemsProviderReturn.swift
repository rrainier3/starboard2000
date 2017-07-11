//
//  ProductItemsProviderReturn.swift
//  justorderstore
//
//  Created by RayRainier on 6/23/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//


import UIKit


final class LiveProducts {
    
    // MARK: Shared Instance
    
    static var sharedInstance = LiveProducts()
    
    private init() { }
    
    // MARK: Local Variable
    
    var items:[Product]?
}


class ProductItemsProviderReturn {
    
    private var _products:[Product] = []
    private var _readOnly = 0.0

    //
    var readOnly: Double {
        return _readOnly
    }
    // this will be a read-only computed attribute,
    // you can even use dot(.) to access the value
    //
    var items: [Product] {
        get {
            return _products
        } set {
            _products = newValue
        }
    }
    
}



/*
 class CardName {
 static var sharedInstance = CardName()
 private init() {}
 
 var cardName: String?
 
 }
 
 Use this to save a value:
 
 CardName.sharedInstance.cardName = "something"
 
 And this to read the value:
 
 CardName.sharedInstance.cardName
*/



