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

class StoreViewController: ColorMatchTabsViewController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies, something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0 	// this causes text to wrap-around
        label.isHidden = true		// defaults to hidden = no Errors
        return label
    }()
    
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

        Service.sharedInstance.fetchHomeFeed { (homeDatasource, err) in
            
            if let err = err {
                
                print("Error : \(err.localizedDescription)")
                
                return
            }
            
            LiveProducts.sharedInstance.items = homeDatasource!
        }
        
        
//        view.addSubview(errorMessageLabel)
//        // UI method call convenience func fillSuperview()
//        errorMessageLabel.fillSuperview()
        
        
        titleLabel.font = UIFont(name: "GothamPro", size: 22)
    
        // to hide bottom button comment the following line
        //        popoverViewController = StorePopoverViewController()
        //        popoverViewController?.delegate = self
        
        dataSource = self
        reloadData()
        
    }
    
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
            titleLabel.text = "VEGGIES"
        case 2:
            titleLabel.text = "NOODLES"
        case 3:
            titleLabel.text = "HOTFOOD"
        default:
            titleLabel.text = "GRILLED"
            
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

