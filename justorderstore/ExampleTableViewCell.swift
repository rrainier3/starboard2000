//
//  ExampleTableViewCell.swift
//  ColorMatchTabs
//
//  Created by RayRainier on 2/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

protocol ChangeViewProtocol: NSObjectProtocol {
    func loadNewScreen(controller: UIViewController) -> Void
}

class ExampleTableViewCell: UITableViewCell {
    
    var product: Product?
	var delegate: ChangeViewProtocol?
    
    @IBOutlet fileprivate weak var contentImageView: UIImageView!
	
    func apply(_ image: UIImage) {
    
        contentImageView.image = image
        
        setupImageForGesture(contentView: contentImageView)
        
    }
    
    let title: UILabel = {
        let thisTitle = UILabel()
        thisTitle.textColor = .white
        thisTitle.clipsToBounds = true
        thisTitle.font = UIFont(name: "GothamPro", size: 16)
        return thisTitle
    }()
    
    let subTitle: UILabel = {
        let thisTitle = UILabel()
        thisTitle.textColor = .white
        thisTitle.clipsToBounds = true
        thisTitle.font = UIFont(name: "GothamPro", size: 12)
        return thisTitle
    }()
    
    let boxer: UIView = {
        let boxerView = UIView()
        boxerView.clipsToBounds = true
        boxerView.backgroundColor = UIColor(r: 50, g: 50, b: 50, a: 0.4)
        return boxerView
    }()
    
    override func layoutSubviews() {
		super.layoutSubviews()
        
        title.text = self.product?.desc
        subTitle.text = self.product?.subdesc
        
        contentImageView.addSubview(boxer)
        contentImageView.addSubview(title)
        contentImageView.addSubview(subTitle)
        
        _ = boxer.anchor(contentImageView.bottomAnchor, left: contentImageView.leftAnchor, bottom: nil, right: contentImageView.rightAnchor, topConstant: -59, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: contentImageView.bounds.width, heightConstant: 60)
        
        _ = title.anchor(contentImageView.bottomAnchor, left: contentImageView.leftAnchor, bottom: nil, right: nil, topConstant: -54, leftConstant: 14, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        _ = subTitle.anchor(title.bottomAnchor, left: title.leftAnchor, bottom: nil, right: nil, topConstant: -2, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

    }

    fileprivate func setupImageForGesture(contentView: UIImageView) {
    
        let imageView = contentView
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectImage)))
        imageView.isUserInteractionEnabled = true

    }
    
    @objc fileprivate func handleSelectImage() {
    
    	flyingImage = contentImageView.image
        flyingProduct = self.product
        
    	let blankViewController = ProductViewController()
        
        if delegate?.responds(to: #selector(ExampleTableViewCell.handleSelectImage)) != nil {
            	delegate?.loadNewScreen(controller: blankViewController)
        }
    }
}
