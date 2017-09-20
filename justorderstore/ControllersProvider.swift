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
        productsViewController.type = .grilled
        
        let venuesViewController = StubContentViewController()
        venuesViewController.type = .veggies
        
        let reviewsViewController = StubContentViewController()
        reviewsViewController.type = .noodles
        
        let usersViewController = StubContentViewController()
        usersViewController.type = .hotfood
        
        /*
         demo: here we hijack the users-link to not render the UITableView
         
         and present a different UIViewController named: ProductViewController
         
         
         let usersViewController = ProductViewController()
         */
        
        
        return [productsViewController, venuesViewController, reviewsViewController, usersViewController]
    }()
    
}
