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
import GradientCircularProgress

class ProductViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
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
        
        // Note: No need to verify user1.type == .Admin to call setupGestureRecognizers()
        // 			because this version is now for Admin only which includes login screen.
        //			The client version will have the basket control and checkout
        
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
        let segmentedControlX = TTSegmentedControl()
        segmentedControlX.allowChangeThumbWidth = false
        segmentedControlX.frame = CGRect(x: 50, y: 200, width: 100, height: 60)
        
        /*
        // segmentedControl 3 type
        segmentedControlX.allowChangeThumbWidth = false
        segmentedControlX.selectedTextFont = UIFont.systemFont(ofSize: 16, weight: 0.3)
        segmentedControlX.defaultTextFont = UIFont.systemFont(ofSize: 16, weight: 0.01)
        segmentedControlX.useGradient = true
        segmentedControlX.useShadow = true
        segmentedControlX.thumbShadowColor = TTSegmentedControl.UIColorFromRGB(0x22C6E7)
        //segmentedControl.thumbGradientColors = [ TTSegmentedControl.UIColorFromRGB(0x25D0EC), TTSegmentedControl.UIColorFromRGB(0x1EA3D8)]
        segmentedControlX.thumbGradientColors = [refTintColor, refTintColor]
        
        */
        
        
        segmentedControlX.itemTitles = ["gas","diesel","electric"]
        //segmentedControlX.allowChangeThumbWidth = false
        segmentedControlX.selectedTextFont = UIFont.systemFont(ofSize: 16, weight: 0.3)
        segmentedControlX.defaultTextFont = UIFont.systemFont(ofSize: 16, weight: 0.01)
        segmentedControlX.cornerRadius = 0
        segmentedControlX.useShadow = false
        segmentedControlX.useGradient = true
        segmentedControlX.thumbGradientColors = [ TTSegmentedControl.UIColorFromRGB(0x819753), TTSegmentedControl.UIColorFromRGB(0xA5BD73)]
        
        
        segmentedControlX.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControlX
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
        
        tv.font = UIFont.fontAvenirMedium(ofSize: 18)
        
        //tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        tv.textColor = UIColor(red: 95/255, green: 100/255, blue: 100/255, alpha: 1)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.isHidden = false
        // Let us style the linespacing CGFloat in this paragraph
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
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
        
        button.backgroundColor = UIColor.RGBHex(0xA5BD73)
        
        //button.backgroundColor = refTintColor
        
        button.setTitle("S A V E", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        
        button.titleLabel?.font = UIFont(name: "GothamPro", size: 18)
        //button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        
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

        //let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapRecognition1))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(photoFunctionHandler))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        
    }

    func handlePlusButton() {
        
        let productUpdateVC = ProductUpdateController()
        
        productUpdateVC.operation = .Create
        
        let presentingVC = UINavigationController(rootViewController: productUpdateVC)
        self.navigationController?.present(presentingVC, animated: true, completion: nil)
        
        return
    }
    
    func handleEditButton() {
        
        let productUpdateVC = ProductUpdateController()
        
        productUpdateVC.operation = .Update
        
        let updateVC = UINavigationController(rootViewController: productUpdateVC)
        
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
     Image handling functions follows
*/

    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    	picker.mediaTypes = [kUTTypeImage as String]
        
        let chosenImageX = info[UIImagePickerControllerEditedImage] as! UIImage
        
        let convertedSize: CGSize = CGSize(width: 722, height: 520)
        
        let chosenImage = imageWithImage(image: chosenImageX, scaledToSize: convertedSize)
        
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

/*
     Firebase database update ...
     
     let ref = FIRDatabase.database().reference()
     let userRef = ref.("location").child("-Khpr_PAuGSVngNspTVW")
     userRef.updateChildValues(["lat": 11.324231])
*/
    
    func persistProductIntoFirebase(_ product: Product) {
        
        let uidStore = FIRAuth.auth()!.currentUser!.uid
        
        let ref = FIRDatabase.database().reference()
        
        let storage = FIRStorage.storage().reference(forURL: "gs://starboard-fbfd1.appspot.com")
        
        //let key = ref.child(uidStore).childByAutoId().key
        
        guard let key = product.key else {
        	print("Error: product.key is Empty!")
            return
        }
        
        let imageRef = storage.child(uidStore).child("\(key).jpg")
        
        let data = UIImageJPEGRepresentation(imageView.image!, 0.3)
        
        // Create file metadata including the content type
        let metadata1 = FIRStorageMetadata()
        metadata1.contentType = "image/jpeg"

		// Setup circularProgressView
        v = 0.0
        progressView = progress.showAtRatio(frame: getRect(), display: true, style: GreenLightStyle())
        progressView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressView!)
        
        let uploadTask = imageRef.put(data!, metadata: metadata1) { (metadata, error) in

            if error != nil {
                print(error!.localizedDescription)
                return
            }
        
            imageRef.downloadURL(completion: { (url, error) in
                if let url = url {
                    let feed = [
                    	"key": key,
                        "storeID" : uidStore,
                        "sku": product.sku!,
                        "desc": product.desc!,
                        "subdesc": product.subdesc!,
                        "category": product.category!,
                        "timestamp": product.timestamp!,
                        "normalImageURL": url.absoluteString,
                        "price1": product.price1!,
                        "price2": product.price2!,
                        "price3": product.price3!,
                        "extendedtext": product.extendedtext!,
                        "active": product.active!
                        ] as [String : Any]
                    
                    let productFeed = ["\(key)" : feed]
                    
                    ref.child(uidStore).child("products").updateChildValues(productFeed)
                    
                }
            })
            
        }
        
        uploadTask.observe(.progress) { (snapshot) in
            
            self.progressView!.isHidden = false
            //self.progressView.setProgress(self.progressView.progress + 0.1, animated: true)
            
            self.v += 0.1
            
            self.progress.updateRatio(CGFloat(self.v))
            
            if self.v > 1.00 {
                
                self.progress.dismiss(progress: self.progressView!)
                return
            }
            
        }
        
        uploadTask.observe(.success) { (snapshot) in
            
            self.progressView!.isHidden = true
            self.progressView!.removeFromSuperview()
            
        }
        
        uploadTask.resume()
        
    }
    
    // setup configuration for circularProgressView
    
    var v: Double = 0.0
    
    var progressView: UIView?
    
    let progress = GradientCircularProgress()
    
    func getRect() -> CGRect {
        return CGRect(
            x: view.frame.origin.x + 15,
            y: (view.frame.size.height - view.frame.size.width) / 2,
            width: view.frame.size.width - 30,
            height: view.frame.size.width - 30)
    }
    
}

