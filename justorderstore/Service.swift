//
//  Service.swift
//  justorderstore
//
//  Created by RayRainier on 6/26/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import Foundation
import Firebase

var productFeed:[Product] = []

// Define Error Type
enum FeedError: Error {
    case noFeed
}

struct Service {
    
    static let sharedInstance = Service()
    
    // our func needs a completion block ()->()
    
    func fetchHomeFeed(completion: @escaping ([Product]?, Error?) -> ()) {

            let storeID = "iLCtXp27p4WL5vaVirCIwW8Eprt2"
            let ref = FIRDatabase.database().reference().child(storeID).child("products")
            ref.observe(.value, with: { snapshot in
                var products: [Product] = []
    
                for item in snapshot.children {
    
    
                    if let item = item as? FIRDataSnapshot {
                        let postDict = Product(data: item.value as! [String : AnyObject])
                        products.append(postDict)
                    }
                }
            
            DispatchQueue.main.async(execute: {
                
                productFeed = products
                
                if productFeed.count == 0 {
                    completion(nil, FeedError.noFeed)
                } else {
                    completion(productFeed, nil)
                }
                
            })
            
        }, withCancel: nil)
    
        
    } // end of function
    
}

