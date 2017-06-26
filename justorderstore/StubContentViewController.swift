//
//  StubContentViewController.swift
//  ColorMatchTabs
//
//  Created by RayRainier on 2/24/17 modified 06/23/17
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import Money
import Firebase

var flyingImage: UIImage!
var flyingProduct: Product!

class StubContentViewController: UITableViewController, ChangeViewProtocol {
    
    enum `Type` {
        case products, venues, reviews, users
    }
    
    var type: Type!
    
    var product: Product!
    
    fileprivate var objects: [Product] = []	// used to be [UIImage]
    
    override func viewWillAppear(_ animated: Bool) {
        
        let loginViewController = LoginViewController()
        
        guard let allowed = verifyLoginAccess else {
            
            self.present(loginViewController, animated: true, completion: nil)
           	return
        }
        
        if allowed == false {
        	
            return
            
            }
        
    } // end of function
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
// let's retrieve product images from Firebase
// first we replace ProductItemsProvider with ProductItemsProviderURL

//        let filterProducts = ProductItemsProvider.items

// *        let filterProducts = ProductItemsProviderURL.items
        //        let products69 = filterProducts.filter({ $0.price == 3995 })
        //        let products49 = filterProducts.filter({ $0.price == 6000 })
        //        let products100 = filterProducts.filter({ $0.price == 1000 })
        //        let products45 = filterProducts.filter({ $0.price == 4500 })

		let filterProducts = ProductItemsProviderFirebaseTest.items
        
//                let products69 = filterProducts.filter({ $0.price == 3995 })
//                let products49 = filterProducts.filter({ $0.price == 6000 })
//                let products100 = filterProducts.filter({ $0.price == 1000 })
//                let products45 = filterProducts.filter({ $0.price == 4500 })
        

        let products69 = filterProducts.filter({ $0.category == "Noodles" })
        let products49 = filterProducts.filter({ $0.category == "Grilled" })
        let products100 = filterProducts.filter({ $0.category == "Veggies" })
        let products45 = filterProducts.filter({ $0.category == "HotFood" })
        
        
        setupTableView()
        
        // setup
        switch type! {
        case .products:
            self.objects = products69
        case .users:
            self.objects = products49
        case .reviews:
            self.objects = products100
        case .venues:
            self.objects = products45
        }
        
        //setupDataSource()
        
    }
    
    fileprivate func setupTableView() {
        tableView.backgroundColor = UIColor.clear
        tableView.allowsSelection = false
        tableView.separatorColor = UIColor.clear
        tableView.register(UINib(nibName: "ExampleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExampleTableViewCell

		var image: UIImage?

		let grabURL = objects[(indexPath as NSIndexPath).row].normalImageURL
        
        product = objects[(indexPath as NSIndexPath).row]
        
        cell.delegate = self		// to enable ChangeViewProtocol

        // create a firebase storage ref
        let storageRef = FIRStorage.storage().reference(forURL: grabURL!)
        
        let storageFileName = storageRef.name
        
        let storeID = "iLCtXp27p4WL5vaVirCIwW8Eprt2"
        
        let imageURL = FIRStorage.storage().reference(forURL: "gs://starboard-fbfd1.appspot.com").child(storeID).child(storageFileName)
        
        imageURL.downloadURL(completion: { (url, error) in
            
            image = nil

            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            let urlString = NSString(string: (url?.absoluteString)!)
            
            // check cache for image first
            if let cachedImage = imageCache.object(forKey: urlString) {
    
                image = cachedImage
                cell.apply(image!)
                
                return
            }
            
            // otherwise fire off a new download
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                guard let imageData = UIImage(data: data!) else { return }
                
                // Add this image to Cache!
                imageCache.setObject(imageData, forKey: urlString)
                
                DispatchQueue.main.async {
                    let flyingImage = imageData
                    cell.apply(flyingImage)
                }
                
            }).resume()
            
        })

        cell.product = product
        
        cell.clipsToBounds = true
        
        return cell
    }
    
    
    // implement ChangeViewProtocol method
    func loadNewScreen(controller: UIViewController) {
        
        let destViewController = ProductViewController()
//        destViewController.product = self.product		// indexPath unreliable here
        
        let navController = UINavigationController(rootViewController: destViewController)
        // we use self.show instead of self.present(controller)
        self.show(navController, sender: self)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.width / 1.4
    }
    
}
