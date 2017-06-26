//
//  StoreViewController.swift
//  justorderstore
//
//  Created by RayRainier on 4/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs
import Firebase

var refTintColor: UIColor = UIColor.clear

var productItems = ProductItemsProviderReturn()

protocol ProductsDelegate{
    func didFetchData(data:[Product])
}

class StoreViewController: ColorMatchTabsViewController, ProductsDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        
        let loginViewController = LoginViewController()
        
        guard let allowed = verifyLoginAccess else {
            
            self.present(loginViewController, animated: true, completion: nil)
           	return
        }
        
        if allowed == false { return }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         initiate firebase call
      */
      
        DispatchQueue.main.async(execute: {
            
            self.productsInFirebase(success: { (results) in
                //print("Local count = \(results.count)")
            })
            
        })
        
        let mainQueue = DispatchQueue.main
        let deadline = DispatchTime.now() + .seconds(10)
        mainQueue.asyncAfter(deadline: deadline) {
            // ...
            
            print("productItems = \(productItems.items.count)")
            
        }
        
        // end of firebase call
        
        titleLabel.font = UIFont(name: "GothamPro", size: 24)
    
        // to hide bottom button comment the following line
        //        popoverViewController = StorePopoverViewController()
        //        popoverViewController?.delegate = self
        
        dataSource = self
        reloadData()
        
    }

    func productsInFirebase (success:([Product])->Void){
        
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
        
        productItems.items = data
        
        for dot in data {
            
            print(dot.sku!)
            print(dot.desc!)
            print(dot.subdesc!)
            
        }
        
    } // end of function
    
} // end of class



extension StoreViewController: ColorMatchTabsViewControllerDataSource {
    
    
    func numberOfItems(inController controller: ColorMatchTabsViewController) -> Int {
        return TabItemsProvider.items.count
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, viewControllerAt index: Int) -> UIViewController {
        
        return StubContentViewControllersProvider.viewControllers[index]
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, titleAt index: Int) -> String {
        
        return TabItemsProvider.items[index].title
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, iconAt index: Int) -> UIImage {
        
        return TabItemsProvider.items[index].normalImage
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, hightlightedIconAt index: Int) -> UIImage {
        
        return TabItemsProvider.items[index].highlightedImage
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, tintColorAt index: Int) -> UIColor {
        
        // print this Category!
        print(TabItemsProvider.items[index].title)
        
        switch index {
            
        case 1:
            titleLabel.text = "HONG-NING"
        case 2:
            titleLabel.text = "JO-FEN"
        case 3:
            titleLabel.text = "STARBUCKS"
        default:
            titleLabel.text = "WHOLEFOODS"
            
        }
        
        refTintColor = TabItemsProvider.items[index].tintColor
        
        return TabItemsProvider.items[index].tintColor
        
    }
    
}

extension StoreViewController: PopoverViewControllerDelegate {
    
    func popoverViewController(_ popoverViewController: PopoverViewController, didSelectItemAt index: Int) {
        selectItem(at: index)
    }
    
}

