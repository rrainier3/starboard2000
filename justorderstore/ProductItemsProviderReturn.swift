//
//  ProductItemsProviderReturn.swift
//  justorderstore
//
//  Created by RayRainier on 6/23/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//


import UIKit

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




