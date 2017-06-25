//
//  MyController.swift
//  justorderstore
//
//  Created by RayRainier on 6/23/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import Foundation
import Firebase

//var results = [Product]()
var providerItems = ProductItemsProviderReturn()

protocol MyDelegate{
    func didFetchData(data:[Product])
}

class MyController : UIViewController, MyDelegate {

    override func viewDidLoad() {


        DispatchQueue.main.async(execute: {
            
            self.myMethod { (results) in
                print("Local count = \(results.count)")
            }
            
        })

        let mainQueue = DispatchQueue.main
        let deadline = DispatchTime.now() + .seconds(10)
        mainQueue.asyncAfter(deadline: deadline) {
            // ...
            
            print("providerItems = \(providerItems.items.count)")
            
            let loginViewController = LoginViewController()
            self.present(loginViewController, animated: true, completion: nil)
        }

    }
    
    func myMethod(success:([Product])->Void){
    
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
            self.didFetchData(data: products)
        })
        
    } // end of function
    
    func didFetchData(data:[Product]){
    
        //Do what you want
        
        providerItems.items = data
        
        for dot in data {
            
            print(dot.sku!)
            print(dot.desc!)
            print(dot.subdesc!)
            
        }
    
    } // end of function
    
}
