//
//  BookingViewController.swift
//  Go Dive Red Sea
//
//  Created by Osama Hosokawa on 2017/11/27.
//  Copyright © 2017 Sara Divers. All rights reserved.
//

import UIKit
import MessageUI

class BookingViewController: UIViewController {
    
    @IBOutlet weak var subProgram: UILabel!
    

    var programName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (programName != nil) {
            print(programName!)
            subProgram.text = programName
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func bookBtnPressed(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail() {
            let version: String? = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
            let currentDevice = UIDevice.current
            let messageBody = "Please keep the information gathered below while contacting Dr. Moku support team.\n Device Model: \(currentDevice.model) \n System: \(currentDevice.model) \(currentDevice.systemName) \(currentDevice.systemVersion) \n Multitasking: \(currentDevice.isMultitaskingSupported) \n ApplicationVersion: \(version ?? "")"
            
            let emailTitle = "New Booking from "
            let toRecipents = ["divewith.saradivers@gmail.com"]
            let mailComposeVC = MFMailComposeViewController()
            mailComposeVC.mailComposeDelegate = self
            mailComposeVC.setSubject(emailTitle)
            mailComposeVC.setMessageBody(messageBody, isHTML: false)
            mailComposeVC.setToRecipients(toRecipents)
            self.present(mailComposeVC, animated: true, completion: nil)
        }else {
            //self.showAlert(title: "Error", message: "Your device could not send e-mail. Please check e-mail configuration of device and try again.")
        }
    }
}

extension BookingViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Mail cancelled")
        case .saved:
            print("Mail saved")
        case .sent:
            print("Mail sent")
        case .failed:
            print("Mail sent failure: \(error?.localizedDescription)")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
