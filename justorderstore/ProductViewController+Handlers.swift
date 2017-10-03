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
            let thisMoney = Money(minorUnits: flyingProduct.price1!)
            priceLabel.text = "\(thisMoney)"

        case 2:
            let thisMoney = Money(minorUnits: flyingProduct.price2!)
            priceLabel.text = "\(thisMoney)"
        
        case 3:
            let thisMoney = Money(minorUnits: flyingProduct.price3!)
            priceLabel.text = "\(thisMoney)"
        
        default:
            let thisMoney = Money(minorUnits: flyingProduct.price1!)
            priceLabel.text = "\(thisMoney)"
        
        }
        return
    }
    
    func setupViews() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        
        imageView.image = flyingImage
        
        containerView.addSubview(imageView)
        
        // 722x520/2 pixel size applied to heightConstant
        _ = imageView.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 520/2)

        // insert our segmented-control here
        segmentedControl.itemTitles = ["Regular","Large","Tray"]
        segmentedControl.didSelectItemWith = { (index, title) -> () in
            print("Selected item \(index) for \(title)")
            self.changePriceLabel(index)
        }
        
        containerView.addSubview(segmentedControl)

		_ = segmentedControl.anchor(imageView.bottomAnchor, left: imageView.leftAnchor, bottom: nil, right: imageView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)

        containerView.addSubview(lineSeparatorView)

        _ = lineSeparatorView.anchor(segmentedControl.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        
        productLabel.text = flyingProduct.desc
    
        productLabel.font = UIFont(name: "GothamPro", size: 18)
        
        containerView.addSubview(productLabel)
        
        _ = productLabel.anchor(lineSeparatorView.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 14, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        productSubLabel.text = flyingProduct.subdesc
        
        productSubLabel.font = UIFont(name: "GothamPro", size: 15)
        
        containerView.addSubview(productSubLabel)
        
        _ = productSubLabel.anchor(productLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 3, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        // insert our priceLabel
        
        let thisMoney = Money(minorUnits: flyingProduct.price1!)
        priceLabel.text = "\(thisMoney)"
        priceLabel.font = UIFont(name: "GothamPro", size: 22)
        
        containerView.addSubview(priceLabel)
        
        _ = priceLabel.anchor(productLabel.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        
		// moved segmented-control ^^

		textView.text = flyingProduct.extendedtext
        //textView.font = UIFont(name: "GothamPro", size: 15)
        
        containerView.addSubview(textView)
        
        _ = textView.anchor(containerView.centerYAnchor, left: productLabel.leftAnchor, bottom: nil, right: containerView.rightAnchor, topConstant: 70, leftConstant: 0, bottomConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 0)
        
        containerView.addSubview(addButton)
        
        _ = addButton.anchor(textView.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 0, widthConstant: 0, heightConstant: 50)
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
    
    // #selector handle saveButton action
    func handleSaveButton() {
    
        guard let productStage = flyingProduct else {
        	print("Error: productStage is Empty!")
            return
        }
        
		self.persistProductIntoFirebase(productStage)
        
		self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    // #selector handleUpdateButton action
    func handleUpdateButton() {

        let presentingVC = UINavigationController(rootViewController: BasketViewController())
        self.navigationController?.present(presentingVC, animated: true, completion: nil)
        
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
        
        navigationItem.leftBarButtonItem = leftButton

		if user1.type == .Admin {
        
            // Add display edit button on right of navigation bar
            let editButton = UIButton(type: .system)
            
            editButton.setImage(#imageLiteral(resourceName: "edit-icon"), for: .normal)
            editButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            editButton.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: -6.0)
            
            editButton.addTarget(self, action: #selector(handleEditButton), for: .touchUpInside)
        
            // Add display addPlus button on right of navigation bar
            let addPlusButton = UIButton(type: .system)
            
            addPlusButton.setImage(#imageLiteral(resourceName: "add-plus"), for: .normal)
            addPlusButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            addPlusButton.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -6.0, bottom: 0.0, right: 0.0)
            
            addPlusButton.addTarget(self, action: #selector(handlePlusButton), for: .touchUpInside)
            
            navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: addPlusButton), UIBarButtonItem(customView: editButton)]
        
        } else {
        
            // let's setup the rightButton for our basket
            let imageSize:CGSize = CGSize(width: 24, height: 24)
            let rightButton = UIButton(type: .custom)
            
            rightButton.frame = CGRect(x: 96, y: 96, width: 26, height: 26)
            rightButton.setImage(#imageLiteral(resourceName: "basket3"), for: .normal)
            rightButton.imageEdgeInsets = UIEdgeInsetsMake(rightButton.frame.size.height/2 - imageSize.height/2, rightButton.frame.size.width/2 - imageSize.width/2, rightButton.frame.size.height/2 - imageSize.height/2, rightButton.frame.size.width/2 - imageSize.width/2)

            rightButton.addTarget(self, action: #selector(handleBasketButton), for: .touchUpInside)

            // setup the badge on the basket with counter!
            giBadgeView.badgeValue = basket.count
            rightButton.addSubview(giBadgeView)
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        }

    }  // end of user1.type == .Admin check

    
    @objc fileprivate func triggerLeftButton() {
        dismiss(animated: true, completion: nil)
        
        self.view = nil
    }
    
}

