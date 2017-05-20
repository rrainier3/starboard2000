//
//  ProductViewController.swift
//  justorderstore
//
//  Created by RayRainier on 4/25/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import ColorMatchTabs
import Firebase
import MobileCoreServices

class ProductViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
//    var product: Product?
    var imagePicker: UIImagePickerController?
    
    var xproduct: Product? {
        didSet {
            
            // update flyingProduct here!
            flyingProduct = xproduct
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        setupNavigationButtons()
        
        setupViews()
        
        setupGestureRecognizers()
    }
    
    // Note: badgeValue initializes back to zero upon dismissing of viewController...
    // so we must define a global var to hold the basket's badgeValue + items-added
    override func viewWillAppear(_ animated: Bool) {
    
        giBadgeView.badgeValue = basket.count			// reEntrant before viewDidLoad

        
    }
    
    func setupNavigationBar() {
        
        UINavigationBar.appearance().barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage(named: "TransparentPixel1")
        let pixelImage = UIImage(named: "Pixel1")
        navigationController?.navigationBar.setBackgroundImage(pixelImage, for: .default)
        
    }
    
    let segmentedControl: TTSegmentedControl = {
        let segmentedControl = TTSegmentedControl()
        segmentedControl.allowChangeThumbWidth = false
        segmentedControl.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        // segmentedControl 3 type
        segmentedControl.allowChangeThumbWidth = false
        segmentedControl.selectedTextFont = UIFont.systemFont(ofSize: 16, weight: 0.3)
        segmentedControl.defaultTextFont = UIFont.systemFont(ofSize: 16, weight: 0.01)
        segmentedControl.useGradient = true
        segmentedControl.useShadow = true
        segmentedControl.thumbShadowColor = TTSegmentedControl.UIColorFromRGB(0x22C6E7)
        //segmentedControl.thumbGradientColors = [ TTSegmentedControl.UIColorFromRGB(0x25D0EC), TTSegmentedControl.UIColorFromRGB(0x1EA3D8)]
        segmentedControl.thumbGradientColors = [refTintColor, refTintColor]
        
        return segmentedControl
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$1.99"
        label.textAlignment = .left
        label.numberOfLines = 0 	// this causes text to wrap-around
        label.isHidden = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 1.00, green: 0.61, blue: 0.16, alpha: 1.00)
        return label
    }()
    
    let containerView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.layer.masksToBounds = true
        return cv
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "camera_trans")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
    }()
    
    let productLabel: UILabel = {
        let label = UILabel()
        label.text = "Ultimate Product"
        label.textAlignment = .left
        label.numberOfLines = 0 	// this causes text to wrap-around
        label.isHidden = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let productSubLabel: UILabel = {
        let label = UILabel()
        label.text = "Advanced Formula Nutrition"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isHidden = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        return label
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        tv.isEditable = false
        tv.textAlignment = .justified
        //tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        tv.textColor = UIColor(red: 95/255, green: 100/255, blue: 100/255, alpha: 1)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.isHidden = false
        // Let us style the linespacing CGFloat in this paragraph
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 8
        let attributes = [NSParagraphStyleAttributeName: style]
        tv.attributedText = NSAttributedString(string: tv.text, attributes: attributes)
        return tv
    }()
    
    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = refTintColor
        
        button.setTitle("S A V E", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        
        button.titleLabel?.font = UIFont(name: "GothamPro", size: 18)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)

        //button.addTarget(self, action: #selector(handleAddButton), for: .touchUpInside)
        
        return button
    }()
    
    public var giBadgeView: GIBadgeView = {
        let badge = GIBadgeView()
        badge.topOffset = 6
        badge.rightOffset = 24
        return badge
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupGestureRecognizers() {

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapRecognition1))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        
    }
    
    func handleTapRecognition1() {
        
        let updateVC = UINavigationController(rootViewController: ProductUpdateController())
        
        updateVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        
        present(updateVC, animated: true, completion: nil)
        
        return
    }

/*
    Photo function handlers for Admin Use
*/
    func photoFunctionHandler() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        
        let cameraAction = UIAlertAction(title: "Use Camera", style: .default) { (action) in
            //self.imagePicker?.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            self.imagePicker?.sourceType = .camera
            self.imagePicker?.allowsEditing = true
            self.imagePicker?.cameraCaptureMode = .photo
            
            self.present(self.imagePicker!, animated: true, completion: nil)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Use Photo Library", style: .default) { (action) in
            self.imagePicker?.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.imagePicker?.sourceType = .photoLibrary
            self.imagePicker?.allowsEditing = true
            
            self.present(self.imagePicker!, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
/*
     Image handling functions follows ...
*/
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    	picker.mediaTypes = [kUTTypeImage as String]
        
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        imageView.contentMode = .scaleAspectFill
        imageView.image = chosenImage
        
        if picker.sourceType == .camera {
            // Chosen Image will be saved in Photo library
            UIImageWriteToSavedPhotosAlbum(imageView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
        
        // pass image to flyingImage
        flyingImage = imageView.image
        
        dismiss(animated: true, completion: nil)
    }
    
    func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save Error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Save Photo", message: "Your picture has been saved to your photos", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func persistProductIntoFirebase(_ product: Product) {
        
        let uidStore = FIRAuth.auth()!.currentUser!.uid
        let ref = FIRDatabase.database().reference()
        let storage = FIRStorage.storage().reference(forURL: "gs://starboard-fbfd1.appspot.com")
        
        let key = ref.child(uidStore).childByAutoId().key
        
        let imageRef = storage.child(uidStore).child("\(key).jpg")
        
        let data = UIImageJPEGRepresentation(imageView.image!, 0.3)
        
        // Create file metadata including the content type
        let metadata1 = FIRStorageMetadata()
        metadata1.contentType = "image/jpeg"
        
        let uploadTask = imageRef.put(data!, metadata: metadata1) { (metadata, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            imageRef.downloadURL(completion: { (url, error) in
                if let url = url {
                    let feed = [
                        "storeID" : uidStore,
                        "sku": product.sku!,
                        "desc": product.desc!,
                        "subdesc": product.subdesc!,
                        "category": product.category!,
                        "timestamp": product.timestamp!,
                        "normalImageURL": url.absoluteString,
                        "qty": product.qty!,
                        "price": product.price!,
                        "extendedtext": product.extendedtext!
                        ] as [String : Any]
                    
                    let productFeed = ["\(key)" : feed]
                    
                    ref.child("stores").updateChildValues(productFeed)
                    
                }
            })
            
        }
        
        uploadTask.resume()
        
    }
    

    
}

