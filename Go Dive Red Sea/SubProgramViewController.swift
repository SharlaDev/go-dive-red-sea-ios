//
//  SubProgramViewController.swift
//  Go Dive Red Sea
//
//  Created by user on 09.12.17.
//  Copyright © 2017 Sara Divers. All rights reserved.
//

import UIKit

class SubProgramViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    //@IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textView: UIWebView!
    @IBOutlet weak var discriptLabel: UILabel!
    
    var subArray = [String]()
   
    
    //MARK: VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.image  = UIImage(named: subArray[2]+".JPG")
        secondImageView.image = UIImage(named: subArray[3]+".JPG")
        discriptLabel.text = subArray[0]
        textView.backgroundColor = UIColor.clear
        textView.loadHTMLString(subArray[1], baseURL: nil)
    }
    
    //MARK: UIStoryboardSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "bookNow") {
            let BookingViewController = (segue.destination as! BookingViewController)
            BookingViewController.programName = discriptLabel.text
        }
    }
    
}

@IBDesignable extension UIView {
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}
