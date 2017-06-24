//
//  ProductItemsProviderReturn.swift
//  justorderstore
//
//  Created by RayRainier on 6/23/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//


import UIKit

class ProductItemsProviderReturn {
    
    private var _billAmount = 0.0
    private var _tipPercent = 0.0
    private var _tipAmount = 0.0
    private var _totalAmount = 0.0
    //
    var tipAmount: Double {
        return _tipAmount
    }
    // this will be a read-only computed attribute,
    // you can even use dot(.) to access the value
    //
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
}




