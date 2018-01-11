//
//  ContactUsViewController.swift
//  Go Dive Red Sea
//
//  Created by Osama Hosokawa on 2017/11/27.
//  Copyright © 2017 Sara Divers. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {
    
    let application = UIApplication.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openFirstWebsite(_ sender: Any) {
        openWebsiteOne()
    }
    
    @IBAction func openSecondWebsite(_ sender: Any) {
        openWebsiteTwo()
    }
    
    @IBAction func dialPhone(_ sender: Any) {
        openDialer()
    }
    
    @IBAction func openWhatsapp(_ sender: Any) {
        openWhatsApp()
    }
    
    @IBAction func openFB(_ sender: Any) {
        openFBPage()
    }
    
    @IBAction func openTwitter(_ sender: Any) {
        openTwitterAccount()
    }
    
    @IBAction func openInstagram(_ sender: Any) {
        openInstagramAccount()
    }
    
    @IBAction func openYoutube(_ sender: Any) {
        openYoutubeChannel()
    }
    
    @IBAction func openWebsite(_ sender: Any) {
        openWebsiteUrl()
    }
    
    
    func openDialer() {
        if let url = URL(string: "tel://\("+201122303000")"), UIApplication.shared.canOpenURL(url) {
            application.open(url)
        } else {
            print("Failed to call")
        }
    }
    
    func openWhatsApp() {
        let whatsAppUrl = URL(string: "whatsapp://+201122303000")
        if application.canOpenURL(whatsAppUrl!)
        {
            application.open(whatsAppUrl!, options: [:], completionHandler: nil)
        }
        else {
            let errorAlert = UIAlertView(title: "Sorry", message: "You can't send a message to this number", delegate: self, cancelButtonTitle:"Ok")
            errorAlert.show()
        }
    }
    
    func openFBPage()  {
        let fbURL = URL(string: "fb://www.facebook.com/godiveredseaegypt")
        let fbWebURL = URL(string: "https://www.facebook.com/godiveredseaegypt")
        
        if application.canOpenURL(fbURL!)
        {
            application.open(fbURL!, options: [:], completionHandler: nil)
        } else {
            application.open(fbWebURL!, options: [:], completionHandler: nil)
            
        }
    }
    
    func openTwitterAccount() {
        let twitterURL = URL(string: "twitter://user?screen_name=godiveredsea")
        
        if application.canOpenURL(twitterURL!)
        {
        application.open(twitterURL!, options: [:], completionHandler: nil)
        } else {
            let twitterWebURL = URL(string: "https://www.twitter.com/godiveredsea")
            application.open(twitterWebURL!, options: [:], completionHandler: nil)
        }
    }
    
    func openInstagramAccount() {
        let instagramUrl = URL(string: "instagram://user?username=godiveredsea")
        let instagramWebUrl = URL(string: "https://www.instagram.com/godiveredsea")
        if application.canOpenURL(instagramUrl!)
        {
            application.open(instagramUrl!, options: [:], completionHandler: nil)
            
        } else {
            application.open(instagramWebUrl!, options: [:], completionHandler: nil)
        }
    }
    
    func openYoutubeChannel() {
        let youtubeChannel =  "UCj_vWyw8XKiEnwlAiNaglYg"
        let appURL = NSURL(string: "youtube://www.youtube.com/channel/\(youtubeChannel)")!
        let webURL = NSURL(string: "https://www.youtube.com/channel/\(youtubeChannel)")!
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Youtube app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
    
    func openWebsiteUrl() {

        let websiteUrl = URL(string: "http://www.godiveredsea.com")
        application.open(websiteUrl!, options: [:], completionHandler: nil)
    }
    
    func openWebsiteOne() {
        let websiteUrl = URL(string: "http://www.saradivers.com")
        application.open(websiteUrl!, options: [:], completionHandler: nil)
    }
    
    func openWebsiteTwo() {
        let websiteUrl = URL(string: "http://www.red-sea-dive.net")
        application.open(websiteUrl!, options: [:], completionHandler: nil)
    }
}
