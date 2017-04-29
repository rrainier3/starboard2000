//
//  ControllersProvider.swift
//  justorderstore
//
//  Created by RayRainier on 4/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs

class StubContentViewControllersProvider {
    
    static let viewControllers: [UIViewController] = {
        let productsViewController = StubContentViewController()
        productsViewController.type = .products
        
        let venuesViewController = StubContentViewController()
        venuesViewController.type = .venues
        
        let reviewsViewController = StubContentViewController()
        reviewsViewController.type = .reviews
        
        let usersViewController = StubContentViewController()
        usersViewController.type = .users
        
        /*
         demo: here we hijack the users-link to not render the UITableView
         
         and present a different UIViewController named: ProductViewController
         
         
         let usersViewController = ProductViewController()
         */
        
        
        return [productsViewController, venuesViewController, reviewsViewController, usersViewController]
    }()
    
}
