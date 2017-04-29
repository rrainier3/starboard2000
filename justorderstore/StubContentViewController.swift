//
//  StubContentViewController.swift
//  ColorMatchTabs
//
//  Created by RayRainier on 2/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import Money

var flyingImage: UIImage!
var flyingProduct: Product!

class StubContentViewController: UITableViewController, ChangeViewProtocol {
    
    enum `Type` {
        case products, venues, reviews, users
    }
    
    var type: Type!
    
    var product: Product!
    
    fileprivate var objects: [Product] = []	// used to be [UIImage]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filterProducts = ProductItemsProvider.items
        
        let products69 = filterProducts.filter({ $0.price == 3995 })
        let products49 = filterProducts.filter({ $0.price == 6000 })
        let products100 = filterProducts.filter({ $0.price == 1000 })
        let products45 = filterProducts.filter({ $0.price == 4500 })
        
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
        
        var image: UIImage!
        
        image = objects[(indexPath as NSIndexPath).row].normalImage
        
        product = objects[(indexPath as NSIndexPath).row]
        
        cell.delegate = self		// to enable ChangeViewProtocol
        
        flyingImage = image
        
        cell.apply(flyingImage)
        
        cell.product = product
        
        cell.clipsToBounds = true
        
        return cell
    }
    
    // implement ChangeViewProtocol method
    func loadNewScreen(controller: UIViewController) {
        
        let destViewController = ProductViewController()
        destViewController.product = self.product		// indexPath unreliable here
        
        let navController = UINavigationController(rootViewController: destViewController)
        // we use self.show instead of self.present(controller)
        self.show(navController, sender: self)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.width / 1.4
    }
    
}
