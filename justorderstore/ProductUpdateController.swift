//
//  ProductUpdateController.swift
//  justorderstore
//
//  Created by RayRainier on 5/1/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import ColorMatchTabs
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class UpdateJitterButton: UIButton, Jitterable {
    
}

class ProductUpdateController: UIViewController, UINavigationControllerDelegate, UITextViewDelegate, UITextFieldDelegate, Jitterable {

    enum OpType {
        case Update
        case Create
        
        init() {
            self = .Update
        }
    }
    
    var operation = OpType()

    let containerView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .clear
        //cv.backgroundColor = UIColor.gray.withAlphaComponent(0.9)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.layer.masksToBounds = true
        return cv
    }()
    
    let productLabel: SkyFloatingLabelTextField = {
        let product_label = SkyFloatingLabelTextField(frame: CGRect(x: 10, y: 10, width: 200, height: 45))
        product_label.placeholder = "Product Title"
        product_label.title = "Product Title"
        product_label.titleColor = .white
        product_label.errorColor = UIColor.orange
        
        product_label.selectedTitle = "Product Title"
        product_label.selectedTitleColor = .white
        product_label.selectedLineColor = .white
        product_label.font = UIFont.fontAvenirMedium(ofSize: 18)
        
        product_label.textColor = .white
        product_label.placeholderColor = UIColor.white.withAlphaComponent(0.8)
        product_label.lineColor = UIColor.white.withAlphaComponent(0.8)

        product_label.textAlignment = .left
        product_label.isHidden = false
        product_label.translatesAutoresizingMaskIntoConstraints = false
        
        return product_label
    }()
    
    let productSubLabel: SkyFloatingLabelTextField = {
        let product_sublabel = SkyFloatingLabelTextField(frame: CGRect(x: 10, y: 10, width: 200, height: 45))
        product_sublabel.placeholder = "Product SubTitle"
        product_sublabel.title = "Product SubTitle"
        product_sublabel.titleColor = .white
        product_sublabel.errorColor = UIColor.orange
        
        product_sublabel.selectedTitle = "Product SubTitle"
        product_sublabel.selectedTitleColor = .white
        product_sublabel.selectedLineColor = .white
        product_sublabel.font = UIFont.fontAvenirMedium(ofSize: 18)
        
        product_sublabel.textColor = .white
        product_sublabel.placeholderColor = UIColor.white.withAlphaComponent(0.8)
        product_sublabel.lineColor = UIColor.white.withAlphaComponent(0.8)
        
        product_sublabel.textAlignment = .left
        product_sublabel.isHidden = false
        product_sublabel.translatesAutoresizingMaskIntoConstraints = false
        
        return product_sublabel
    }()
    
    let productDescription: UITextView = {
        let tv = UITextView()
        tv.isEditable = true
        tv.textAlignment = .justified
        
        tv.textColor = .white
		tv.font = UIFont.fontAvenirMedium(ofSize: 18)
        tv.layer.borderColor = UIColor.white.cgColor
        tv.layer.borderWidth = 1

        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear

        tv.isHidden = false
        
        // Let us style the linespacing CGFloat in this paragraph
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 6
    
        let attributes = [NSParagraphStyleAttributeName: style]
        tv.attributedText = NSAttributedString(string: tv.text, attributes: attributes)
        return tv
    }()

    let productActiveSwitch: TTSegmentedControl = {
        let productActiveSwitchX = TTSegmentedControl()
        productActiveSwitchX.itemTitles = ["ON","OFF"]
        productActiveSwitchX.selectedTextFont = UIFont.systemFont(ofSize: 16, weight: 0.3)
        productActiveSwitchX.defaultTextFont = UIFont.systemFont(ofSize: 16, weight: 0.01)
        productActiveSwitchX.useGradient = false
        productActiveSwitchX.thumbColor = TTSegmentedControl.UIColorFromRGB(0x1FDB58)
        productActiveSwitchX.useShadow = true
        productActiveSwitchX.thumbShadowColor = TTSegmentedControl.UIColorFromRGB(0x56D37C)
        productActiveSwitchX.allowChangeThumbWidth = false
        productActiveSwitchX.translatesAutoresizingMaskIntoConstraints = false
        
        return productActiveSwitchX
    }()
    
    let productUpdateButton: UpdateJitterButton = {
        
        let button = UpdateJitterButton(type: .system)
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        
        button.setTitle("C O N T I N U E", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .normal)
        
        button.titleLabel?.font = UIFont(name: "GothamPro", size: 18)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.7).cgColor
        button.layer.borderWidth = 1.4
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleUpdateButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        let loginViewController = LoginViewController()
        
        guard let allowed = verifyLoginAccess else {
            
            self.present(loginViewController, animated: true, completion: nil)
           	return
        }
        
        if allowed == false { return }
        
        print("OpType Enum: \(operation)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        
        let dimAlphaColor = UIColor.gray.withAlphaComponent(0.9)
        
        self.view.backgroundColor = dimAlphaColor
        
        self.view.tintColor = .white
 
        
        setupNavigationButtons()
		setupContainerView()
/*
		All fields to be updated below including UpdateButton - 05/01/17
*/
        setupProductTitleField()
        setupProductSubTitleField()
        setupProductDescriptionText()

        setupProductActiveSwitch()
        setupProductUpdateButton()
    }
    
    func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
    }
    
    func setupNavigationButtons() {
        
        self.title = flyingProduct.category
        let uiFont = UIFont(name: "GothamPro", size: 24)
        let uiColor = UIColor.white.withAlphaComponent(0.7)
        let titleAttributes = [NSFontAttributeName: uiFont! as UIFont, NSForegroundColorAttributeName: uiColor as UIColor]

        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.titleTextAttributes = titleAttributes
        navigationBar?.tintColor = UIColor.white.withAlphaComponent(0.7)
        
        makeNavigationBarTransparent(navigationBar!)
        
        let leftButton =  UIBarButtonItem(image: UIImage(named: "left-arrow"), style: .plain, target: self, action: #selector(triggerLeftButton))
        
        navigationItem.leftBarButtonItem = leftButton
        
    }
    
    @objc fileprivate func makeNavigationBarTransparent(_ navigationBar: UINavigationBar ) {
        let transparentPixel = UIImage(named: "TransparentPixel1")
        navigationBar.setBackgroundImage(transparentPixel, for: UIBarMetrics.default)
        navigationBar.shadowImage = transparentPixel
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.isTranslucent = true
    }

    @objc fileprivate func triggerLeftButton() {
        dismiss(animated: true, completion: nil)
        
        self.view = nil
    }
    
    func handleUpdateButton() {
        
        guard let productL = productLabel.text, let productSubL = productSubLabel.text else {
            productUpdateButton.jitter()
            return
        }
        
        guard let error = productLabel.errorMessage, let error2 = productSubLabel.errorMessage else {
            productUpdateButton.jitter()
            return
        }
        

        print(productDescription.text)
        print(error, error2)
        print("ProductActive Switch:")
        print(productActiveSwitch.currentIndex)
        
/*
		configure Firebase persistence here ...
*/
        var newProduct = Product(data:[
        	"key": flyingProduct.key as AnyObject,
            "sku": flyingProduct.sku as AnyObject,
            "storeID" : flyingProduct.storeID as AnyObject,
            "desc": productL as AnyObject,
            "subdesc": productSubL as AnyObject,
            "category": self.title as AnyObject,
            "timestamp": flyingProduct.timestamp as AnyObject,
            "normalImageURL": flyingProduct.normalImageURL as AnyObject,
            "qty": 4 as AnyObject,
            "price": 995 as Int as AnyObject,
            "extendedtext": productDescription.text as AnyObject,
            "active": productActiveSwitch.currentIndex as Int as AnyObject
            ])

        if operation == .Create {
            newProduct = makeNewProductEntry(productL: productL, productSubL: productSubL)
        }
        
		let productViewController = ProductViewController()
        productViewController.xproduct = newProduct
        
        let presentingVC = UINavigationController(rootViewController: productViewController)
        self.navigationController?.present(presentingVC, animated: true, completion: nil)

    }
    
    func makeNewProductEntry(productL: String, productSubL: String)-> Product {

        let uidStore = FIRAuth.auth()!.currentUser!.uid

        let ref = FIRDatabase.database().reference()

        let key = ref.child(uidStore).childByAutoId().key
        
        let generatedSKU = NSUUID().uuidString

        let thisProduct = Product(data:[
            "key": key as AnyObject,
            "storeID" : uidStore as AnyObject,
            "sku": generatedSKU as AnyObject,
            "desc": productL as AnyObject,
            "subdesc": productSubL as AnyObject,
            "category": self.title as AnyObject,
            "timestamp": NSDate().timeIntervalSince1970 as AnyObject,
            "normalImageURL": flyingProduct.normalImageURL as AnyObject,
            "qty": 4 as AnyObject,
            "price": 995 as Int as AnyObject,
            "extendedtext": productDescription.text as AnyObject,
            "active": productActiveSwitch.currentIndex as Int as AnyObject
            ])
        
        return thisProduct
    }
    
    func setupProductUpdateButton() {
        
        self.view.addSubview(productUpdateButton)
        
        _ = productUpdateButton.anchor(self.view.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 30, leftConstant: 16, bottomConstant: 30, rightConstant: 20, widthConstant: 0, heightConstant: 50)
        
    }
    
    func setupProductTitleField() {
    
    	self.productLabel.text = flyingProduct.desc
        
        if operation == .Create {
            self.productLabel.text = ""
        }
        
        self.productLabel.delegate = self
        
        let width = self.view.bounds.width - 60
        
        self.view.addSubview(productLabel)
        _ = productLabel.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 100, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 50)
    }
    
    func setupProductSubTitleField() {
    
    	self.productSubLabel.text = flyingProduct.subdesc
        
        if operation == .Create {
            self.productSubLabel.text = ""
        }
        
        self.productSubLabel.delegate = self
        
        let width = self.view.bounds.width - 60
        
        self.view.addSubview(productSubLabel)
        
        _ = productSubLabel.anchor(productLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 4, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 50)
    }
    
    func setupProductDescriptionText() {
    
    	self.productDescription.text = flyingProduct.extendedtext

        if operation == .Create {
            self.productDescription.text = ""
        }
    
        let width = self.view.bounds.width - 60
        
        self.view.addSubview(productDescription)
        
        _ = productDescription.anchor(productSubLabel.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 40, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 140)
    }

    func setupProductActiveSwitch() {
        
        let width:CGFloat = 16.00
        
        self.view.addSubview(productActiveSwitch)
        
        _ = productActiveSwitch.anchor(productDescription.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 30, bottomConstant: 0, rightConstant: 0, widthConstant: width, heightConstant: 32)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Implementing a method on the UITextFieldDelegate protocol. This will notify us when something has changed on the textfield
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let floatingLabelTextField = textField as? SkyFloatingLabelTextField {
            
            floatingLabelTextField.errorMessage = validateSkyFloatingTextField(skyFloatingTextField: floatingLabelTextField)
            
        }
        return true
    }
    
    func validateSkyFloatingTextField(skyFloatingTextField: SkyFloatingLabelTextField) -> String {
        
        let text = skyFloatingTextField.text
        if ((text?.characters.count)! < 3) {
            skyFloatingTextField.errorMessage = "Input Error"
        } else {
            // The error message will only disappear when we reset it to nil or empty string
            skyFloatingTextField.errorMessage = ""
        }
        
        return skyFloatingTextField.errorMessage!
    }
    
    /*
     Override keyboard to dismiss
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        super.touchesBegan(touches, with: event)
    }
    
    
    
}

