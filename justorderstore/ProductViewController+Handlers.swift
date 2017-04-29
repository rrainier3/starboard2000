//
//  ProductViewController+Handlers.swift
//  justorderstore
//
//  Created by RayRainier on 4/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs
import Money

extension ProductViewController {
    
    
    func changePriceLabel(_ selectedIndex: Int) {
        
        // we can implement this within a dictionary [index, value] returning value
        switch selectedIndex {
        case 1:
            priceLabel.text = "$19.95"
            flyingProduct?.price = 1995
        case 2:
            priceLabel.text = "$49.50"
            flyingProduct?.price = 4950
        case 3:
            priceLabel.text = "$74.99"
            flyingProduct?.price = 7499
        default:
            priceLabel.text = "$19.95"
            flyingProduct?.price = 1995
        }
        return
    }
    
    func setupViews() {
        
        self.view.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        
        imageView.image = flyingImage
        
        containerView.addSubview(imageView)
        
//        containerView.addSubview(cameraButton)
//        
//        _ = cameraButton.anchor(imageView.centerYAnchor, left: imageView.centerXAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        // 722x520/2 pixel size applied to heightConstant
        _ = imageView.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 520/2)
        
        containerView.addSubview(lineSeparatorView)
        
        _ = lineSeparatorView.anchor(imageView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        
        productLabel.text = flyingProduct.desc
        productLabel.font = UIFont(name: "GothamPro", size: 18)
        containerView.addSubview(productLabel)
        
        _ = productLabel.anchor(lineSeparatorView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        productSubLabel.text = flyingProduct.subdesc
        productSubLabel.font = UIFont(name: "GothamPro", size: 15)
        containerView.addSubview(productSubLabel)
        
        _ = productSubLabel.anchor(productLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 3, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        // insert our priceLabel
        
        let thisMoney = Money(minorUnits: flyingProduct.price!)
        priceLabel.text = "\(thisMoney)"
        priceLabel.font = UIFont(name: "GothamPro", size: 22)
        containerView.addSubview(priceLabel)
        
        _ = priceLabel.anchor(productLabel.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
        // insert our segmented-control here
        segmentedControl.itemTitles = ["Regular","Large","Tray"]
        segmentedControl.didSelectItemWith = { (index, title) -> () in
            print("Selected item \(index) for \(title)")
            self.changePriceLabel(index)
        }
        
        containerView.addSubview(segmentedControl)
        
        _ = segmentedControl.anchor(productSubLabel.bottomAnchor, left: productSubLabel.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 16, leftConstant: 8, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 40)
        
        textView.font = UIFont(name: "GothamPro", size: 15)
        containerView.addSubview(textView)
        
        _ = textView.anchor(segmentedControl.bottomAnchor, left: productSubLabel.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 10, leftConstant: -2, bottomConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 0)
        
        containerView.addSubview(addButton)
        
        _ = addButton.anchor(textView.bottomAnchor, left: textView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 20, rightConstant: 12, widthConstant: 0, heightConstant: 50)
    }
    
    // #selector handle addButton action
    func handleAddButton() {
        
        giBadgeView.increment()
        
        print(giBadgeView.badgeValue)
        
        
        // approach #2 check the basket first before appending
        
        if !checkIfDuplicate(flyingProduct.desc!, basket: basket) {
            basket.append(flyingProduct)
        }
        
        // approach #1 filter the basket after appending
        //basket.append(flyingProduct)
        //basket = checkBasketForDuplicates(basket)
        
    }
    
    // #selector handle basketButton action
    func handleBasketButton() {
        
        giBadgeView.badgeValue = basket.count
        
        guard basket.count != 0 else {
            return
        }
        
        let presentingVC = UINavigationController(rootViewController: BasketViewController())
        self.navigationController?.present(presentingVC, animated: true, completion: nil)
    }
    // check basket for duplicates via checkBasketForDuplicates
    func checkBasketForDuplicates(_ basket: [Product]) -> [Product] {
        
        var result:[Product] = []
        basket.forEach { (b) -> () in
            if !result.contains (where: { $0.desc == b.desc }) {
                result.append(b)
            }
        }
        
        return result
    }
    // check basket for duplicates via checkIfDuplicate
    func checkIfDuplicate(_ desc: String, basket: [Product]) -> Bool {
        
        var checkpoint: Bool = false
        basket.forEach { (b) in
            if desc == b.desc {
                checkpoint = true
            }
        }
        return checkpoint
    }
    
    func setupNavigationButtons() {
        
        self.title = flyingProduct.category
        
        let uiFont = UIFont(name: "GothamPro", size: 24)
        
        let uiColor = refTintColor
        let titleAttributes = [NSFontAttributeName: uiFont! as UIFont, NSForegroundColorAttributeName: uiColor as UIColor]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        
        self.view.backgroundColor = .white
        
        let navigationBar = navigationController!.navigationBar
        navigationBar.backgroundColor = .white
        navigationBar.tintColor = refTintColor
        
        let leftButton =  UIBarButtonItem(image: UIImage(named: "left-arrow"), style: .plain, target: self, action: #selector(triggerLeftButton))
        
        let rightButton = UIButton(type: .custom)
        
		if user1.type == .Admin {
            // let's setup the rightButton for our photoFunctionHandler
            let imageSize:CGSize = CGSize(width: 30, height: 28)
            //let rightButton = UIButton(type: .custom)
            rightButton.frame = CGRect(x: 120, y: 96, width: 30, height: 28)
            rightButton.setImage(#imageLiteral(resourceName: "camera_trans"), for: .normal)
            rightButton.imageEdgeInsets = UIEdgeInsetsMake(rightButton.frame.size.height/2 - imageSize.height/2, rightButton.frame.size.width/2 - imageSize.width/2, rightButton.frame.size.height/2 - imageSize.height/2, rightButton.frame.size.width/2 - imageSize.width/2)
            
            rightButton.addTarget(self, action: #selector(photoFunctionHandler), for: .touchUpInside)
        } else {
            // let's setup the rightButton for our basket
            let imageSize:CGSize = CGSize(width: 24, height: 24)
            //let rightButton = UIButton(type: .custom)
            rightButton.frame = CGRect(x: 96, y: 96, width: 26, height: 26)
            rightButton.setImage(#imageLiteral(resourceName: "basket3"), for: .normal)
            rightButton.imageEdgeInsets = UIEdgeInsetsMake(rightButton.frame.size.height/2 - imageSize.height/2, rightButton.frame.size.width/2 - imageSize.width/2, rightButton.frame.size.height/2 - imageSize.height/2, rightButton.frame.size.width/2 - imageSize.width/2)
            
            rightButton.addTarget(self, action: #selector(handleBasketButton), for: .touchUpInside)
            
            // setup the badge on the basket with counter!
            giBadgeView.badgeValue = basket.count
            rightButton.addSubview(giBadgeView)
        }

        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
    }
    
    @objc fileprivate func triggerLeftButton() {
        dismiss(animated: true, completion: nil)
        
        self.view = nil
    }
    
}

