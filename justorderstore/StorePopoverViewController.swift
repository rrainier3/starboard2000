//
//  StorePopoverViewController.swift
//  justorderstore
//
//  Created by RayRainier on 4/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs

class StorePopoverViewController: PopoverViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContentView()
    }
    
    fileprivate func setupContentView() {
        let imageView = UIImageView(image: UIImage(named: "popover_placeholder"))
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        let padding: CGFloat = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
