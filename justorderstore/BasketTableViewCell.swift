//
//  BasketTableViewCell.swift
//  Example
//
//  Created by RayRainier on 3/9/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import Money

class BasketTableViewCell: UITableViewCell {
    
    var product: Product? {
        didSet {
            
            //setupProductPriceLabel()
        }
    }
    
    private func setupProductPriceLabel() {

//  Implement in BasketViewController --->
//        let price = Money(minorUnits: (flyingProduct?.price)!)
//        priceLabel.text = "\(price)"
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = self.bounds
        let width = bounds.width
        let height = bounds.height
        
        // In the box
        let someFrame = CGRect(x: 28, y: 4, width: width - 48, height: height - 8)
        containerView.frame = someFrame
    
        // overriding textLabels' constraints in UITableViewCell
        textLabel?.frame = CGRect(x: 120, y: ((textLabel?.frame.origin.y)! - 12), width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
        
        detailTextLabel?.frame = CGRect(x: 120, y: ((detailTextLabel?.frame.origin.y)! - 10), width: (detailTextLabel?.frame.width)!, height: (detailTextLabel?.frame.height)!)
    }
    
    let containerView: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor(r: 250, g: 250, b: 250)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.masksToBounds = true
        return container
    }()

    let ProductImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        //imageView.image = UIImage(named: "product_card1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GothamPro", size: 18)
        label.textColor = refTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.textColor = .black
        detailTextLabel?.textColor = .black
        
        addSubview(textLabel!)
        addSubview(detailTextLabel!)
        
		addSubview(containerView)
        sendSubview(toBack: containerView)

        addSubview(ProductImageView)

        addSubview(priceLabel)
        
        // x,y,width,height constraints
        ProductImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        ProductImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 28).isActive = true
        ProductImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        ProductImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -8).isActive = true
        
        _ = priceLabel.anchor(self.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: -30, leftConstant: 0, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 18)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
