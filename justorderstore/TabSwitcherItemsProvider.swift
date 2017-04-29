//
//  TabSwitcherItemsProvider.swift
//  justorderstore
//
//  Created by RayRainier on 4/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs

class TabItemsProvider {
    
    static let items = {
        return [
            TabItem(
                title: "Grilled",
                tintColor: UIColor.gray.withAlphaComponent(0.70),
                //tintColor: UIColor(red: 0.51, green: 0.72, blue: 0.25, alpha: 1.00),
                normalImage: UIImage(named: "Grill")!,
                highlightedImage: UIImage(named: "GrillFilled")!
            ),
            TabItem(
                title: "Veggies",
                tintColor: UIColor.gray.withAlphaComponent(0.70),
                //                tintColor: UIColor(red: 0.15, green: 0.67, blue: 0.99, alpha: 1.00),
                normalImage: UIImage(named: "NaturalFood")!,
                highlightedImage: UIImage(named: "NaturalFoodFilled")!
            ),
            TabItem(
                title: "Noodles",
                tintColor: UIColor.gray.withAlphaComponent(0.70),
                //                tintColor: UIColor(red: 1.00, green: 0.61, blue: 0.16, alpha: 1.00),
                normalImage: UIImage(named: "Noodles")!,
                highlightedImage: UIImage(named: "NoodlesFilled")!
            ),
            TabItem(
                title: "HotFood",
                tintColor: UIColor.gray.withAlphaComponent(0.70),
                //                tintColor: UIColor(red: 0.96, green: 0.61, blue: 0.58, alpha: 1.00),
                normalImage: UIImage(named: "FryingPan")!,
                highlightedImage: UIImage(named: "FryingPanFilled")!
            )
        ]
    }()
    
}


