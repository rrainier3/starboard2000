//
//  ProductItemsProviderFirebase.swift
//  justorderstore
//
//  Created by RayRainier on 6/22/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

//
//  ProductItemsProviderFirebaseTest.swift
//  justorderstore
//
//  Created by RayRainier on 6/22/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//


import UIKit
import Firebase

class ProductItemsProviderFirebase: NSObject {

	var products = [Product]()
	var results = [Product]()

//    static let items = {
//        
//        retrieveProducts(completionHandler: {
//            
//            isSuccessful -> Void in
//            if isSuccessful {
//                
//                return self.results
//                
//            } else {
//                
//                print("Error: completionHandler")
//                
//                return nil
//                
//            }
//        })
    
//    }()
    
    func retrieveProducts(completionHandler: @escaping (Bool) -> Void) {
        
        
        let storeID = "iLCtXp27p4WL5vaVirCIwW8Eprt2"
        
        FIRDatabase.database().reference().child(storeID).child("products").observe(.childAdded, with: {(snapshot) in
            
            if let snapDictionary = snapshot.value as? [String: AnyObject] {
                
                let product = Product(data: snapDictionary)
                
                self.products.append(product)
                
            }
            
            DispatchQueue.main.async(execute: {
                
                self.results = self.products
                
                if self.results.count == 0 {
                    completionHandler(false)
                } else {
                    completionHandler(true)
                }
                
            })
            
        }, withCancel: nil)
        
    }	// end-of-function
    

}




