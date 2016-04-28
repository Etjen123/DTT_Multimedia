//
//  ViewController.swift
//  DTTMultimedia
//
//  Created by Etjen Ymeraj on 4/26/16.
//  Copyright © 2016 Etjen Ymeraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //get screen width and height
        let screenSize: CGRect = UIScreen.mainScreen().bounds

        //assign to variables
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
        //put the background to main screen
        let imageName = "img_background-i5@3x.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        view.addSubview(imageView)
        
        //create a navigation bar 
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, screenWidth, screenHeight/10))
        
        //navigationBar.backgroundColor = UIColor.whiteColor()
        //navigationBar.delegate = self;
        
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationBar.barTintColor = UIColorFromRGB(0x0092BB)
        navigationBar.tintColor = UIColor.whiteColor()

        navigationItem.title = "RSR Revalidatieservice"
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

        
        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]
        
        //create a button for the top bar view
        let infoButton   = UIButton()
        
        if let imageButton = UIImage(named: "ic_over_normal@3x.png") {
            infoButton.setImage(imageButton, forState: .Normal)
        }
        
        //add a target function
        infoButton.addTarget(self, action: "infoButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        infoButton.frame = CGRectMake(0, 0, 32, 32)
        
        let barButton = UIBarButtonItem(customView: infoButton)
        //assign button to navigationbar
        navigationItem.rightBarButtonItem = barButton
    
        
        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)
        
        
        //create bottom button
       
        let orignY : CGFloat = screenHeight-100
        let gap : CGFloat = 10
        
        //button dimensions
        let buttonWidth : CGFloat = screenWidth-30
        let buttonHeight : CGFloat = 60

        
        let myButton = UIButton()
        myButton.backgroundColor = UIColor.blueColor()


        myButton.frame = CGRectMake(0, orignY, buttonWidth, buttonHeight)
        myButton.center.x = self.view.center.x // for horizontal
        myButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //Border
        //myButton.layer.borderColor = UIColor.blueColor().CGColor
        //myButton.layer.borderWidth = borderSize
        myButton.layer.cornerRadius = 5
        
        //Image
        let myImage = UIImage(named: "ic_attention@2x.png")
        myButton.setImage(myImage, forState: UIControlState.Normal)
        myButton.setImage(UIImage(named: "ic_attention@2x.png"), forState: UIControlState.Highlighted)
        myButton.imageEdgeInsets = UIEdgeInsets(top: gap, left: 0, bottom: gap, right: gap)
        
        //Text
        myButton.setTitle("RSR Pechhulp", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 25)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        myButton.backgroundColor = UIColorFromRGB(0x0092BB)
        myButton.titleEdgeInsets = UIEdgeInsets(top: gap, left: gap, bottom: gap, right: 0.0)
        
        view.addSubview(myButton)
        

        
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func buttonAction(sender:UIButton!)
    {
        var controller = RSRPechhulpViewController()
        print("Button tapped")
        self.presentViewController(controller, animated: true, completion: nil)

    }

//This method will call when you press button.
func infoButtonPressed() {
    
    var controller = OverRSRViewController()
    print("Button tapped")
    self.presentViewController(controller, animated: true, completion: nil)
    

}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

