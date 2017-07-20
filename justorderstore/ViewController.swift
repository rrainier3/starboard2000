//
//  ViewController.swift
//  justorderstore
//
//  Created by RayRainier on 4/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import Eureka
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

class MyFormViewController: FormViewController {

    let loginRegisterButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.red.withAlphaComponent(0.8)
        
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
    
    let rowSwitch: SwitchRow = SwitchRow("SwitchARow") { row in      // initializer
        row.title = "The Switch-A-Row"
        }.onChange { row in
            row.title = (row.value ?? false) ? "The title expands whenever" : "The title"
            row.updateCell()
        }.cellSetup { cell, row in
            cell.backgroundColor = .gray
           
        }.cellUpdate { cell, row in
            cell.textLabel?.font = UIFont.fontAvenirMedium(ofSize: 18)
            cell.textLabel?.textColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true

		self.tableView?.backgroundColor = UIColor.white
        
        self.rowSwitch.cell.layer.borderWidth = 0
        self.rowSwitch.cell.layer.borderColor = (UIColor.white).cgColor
        
        let row  = SwitchRow("SwitchRow") { row in      // initializer
            row.title = "The Second Row"
            }.onChange { row in
                row.title = (row.value ?? false) ? "The Second expands when on" : "The Second "
                row.updateCell()
            }.cellSetup { cell, row in
                cell.backgroundColor = .lightGray
            }.cellUpdate { cell, row in
                cell.textLabel?.font = .italicSystemFont(ofSize: 18.0)
        }
        
        form +++

        	Section() {
            	$0.header = HeaderFooterView<EurekaLogoView>(.class)
            }
            
        	<<< rowSwitch
        	<<< row
        	
            <<< TextRow(){ row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
                
            }
            <<< PhoneRow(){
                $0.title = "Phone Row"
                $0.placeholder = "And numbers here"
            }
            +++ Section("Section2")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
        	}
        
        setupLoginRegisterButton()
        
	}
    
    func setupLoginRegisterButton() {
        
        let width = self.view.bounds.width - 20
        
        self.view.addSubview(loginRegisterButton)
        _ = loginRegisterButton.anchor(self.view.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: nil, topConstant: -120, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 50)
    }
    
}
