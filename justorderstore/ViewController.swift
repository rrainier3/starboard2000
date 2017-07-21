//
//  ViewController.swift
//  justorderstore
//
//  Created by RayRainier on 4/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class EurekaLogoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let imageView = UIImageView(image: UIImage(named: "Eureka"))
        imageView.frame = CGRect(x: 0, y: 0, width: 320, height: 130)
        imageView.autoresizingMask = .flexibleWidth
        self.frame = CGRect(x: 0, y: 0, width: 320, height: 130)
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MyFormViewController: UIViewController {

    let loginRegisterButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 245, g: 101, b: 94)
        //button.backgroundColor = UIColor.red.withAlphaComponent(0.8)
        
        button.setTitle("L O G I N", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.9), for: .normal)
        
        button.titleLabel?.font = UIFont(name: "GothamPro", size: 18)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.9).cgColor
        button.layer.borderWidth = 1.4
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    func handleLoginButton() {
        print(123)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true

        
        setupLoginRegisterButton()
        
	}
    
    func setupLoginRegisterButton() {
        
        let width = self.view.bounds.width - 20
        
        self.view.addSubview(loginRegisterButton)
        _ = loginRegisterButton.anchor(self.view.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: -120, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 50)
    }
    
}
