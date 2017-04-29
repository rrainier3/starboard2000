//
//  TotalTableViewCell.swift
//  Example
//
//  Created by RayRainier on 3/18/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//
//		Note: Deprecated refer to UITableView.footerView implementation 03302017 rr

import UIKit
import Money

class TotalTableViewCell: UITableViewCell {
    
    var totalFormatted: String?
    
    var product: Product? {
        didSet {
            
            totalLabel.text = totalFormatted
            
        }
    }
    
    private func setupNameAndProductImage() {
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = self.bounds
        let width = bounds.width
        let height = bounds.height
        
        // In the box
        let someFrame = CGRect(x: 28, y: 4, width: width - 48, height: height - 8)
        containerView.frame = someFrame

 		totalLabel.text = totalFormatted
        
    }
    
    let containerView: UIView = {
        let container = UIView()
        //container.backgroundColor = UIColor(r: 250, g: 250, b: 250)
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.masksToBounds = true
        return container
    }()
    
    let separatorLineView: UIView = {
        let thinLine = UIView()
        thinLine.backgroundColor = refTintColor
        thinLine.translatesAutoresizingMaskIntoConstraints = false
        thinLine.layer.masksToBounds = true
        return thinLine
    }()
    
    let ProductImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "product_card1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.isHidden = true
        return imageView
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "$10.99"
        label.font = UIFont(name: "GothamPro", size: 22)
        label.textColor = refTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TOTAL"
        label.font = UIFont(name: "GothamPro", size: 22)
        label.textColor = refTintColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(containerView)
        containerView.addSubview(ProductImageView)
		containerView.addSubview(titleLabel)
        containerView.addSubview(totalLabel)
        addSubview(separatorLineView)
        
        // x,y,width,height constraints
        ProductImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        ProductImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        ProductImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ProductImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -8).isActive = true

        _ = titleLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 14, leftConstant: 120, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 18)
        
        _ = totalLabel.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 14, leftConstant: 0, bottomConstant: 0, rightConstant: 60, widthConstant: 0, heightConstant: 18)
        
        _ = separatorLineView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 28, bottomConstant: 0, rightConstant: 0, widthConstant: self.bounds.width + 8, heightConstant: 1)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
