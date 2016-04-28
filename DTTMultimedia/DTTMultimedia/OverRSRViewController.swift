//
//  OverRSRViewController.swift
//  DTTMultimedia
//
//  Created by Etjen Ymeraj on 4/27/16.
//  Copyright © 2016 Etjen Ymeraj. All rights reserved.
//

import UIKit
import WebKit

class OverRSRViewController: UIViewController, UIWebViewDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = UIColor.whiteColor()
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        //assign to variables
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height

        // Do any additional setup after loading the view.
        
        //create a navigation bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, screenWidth, screenHeight/10))
        
        //navigationBar.backgroundColor = UIColor.whiteColor()
        //navigationBar.delegate = self;
        
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationBar.barTintColor = UIColorFromRGB(0x0092BB)
        navigationBar.tintColor = UIColor.whiteColor()
        
        navigationItem.title = "Over RSR"
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]
        
        //create a button for the top bar view
        let infoButton   = UIButton()
        
        if let imageButton = UIImage(named: "terug_normal@3x.png") {
            infoButton.setImage(imageButton, forState: .Normal)
        }
        
        //add a target function
        infoButton.addTarget(self, action: "backButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        infoButton.frame = CGRectMake(0, 0, 64, 64)
        
        let barButton = UIBarButtonItem(customView: infoButton)
        //assign button to navigationbar
        navigationItem.leftBarButtonItem = barButton
        
        let imageName = "over_image@3x.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: 0, y: screenHeight/10, width: screenWidth, height: screenHeight/2.5)
        
        var lineView=UIView(frame: CGRectMake(0, screenHeight/2, screenWidth, 5))
        lineView.backgroundColor=UIColorFromRGB(0x0092BB)

        
        let webV:UIWebView = UIWebView(frame: CGRectMake(0, screenHeight/2 + 5, screenWidth, screenHeight/2))
        webV.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.rsr.nl/index.php?page=over-rsr")!))
        webV.delegate = self;
        
        
        self.view.addSubview(webV)
        

        
        
        
        //self.view.addSubview(textView)
        self.view.addSubview(lineView)
        view.addSubview(imageView)

        
        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if navigationType == UIWebViewNavigationType.LinkClicked {
            UIApplication.sharedApplication().openURL(request.URL!)
            return false
        }
        return true
    }
    
    func backButtonPressed(){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
