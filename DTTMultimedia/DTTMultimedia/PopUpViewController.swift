//
//  PopUpViewController.swift
//  DTTMultimedia
//
//  Created by Etjen Ymeraj on 4/27/16.
//  Copyright © 2016 Etjen Ymeraj. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        //assign to variables
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        var frameView=UIView(frame: CGRectMake(20, screenHeight-300, screenWidth-40, screenHeight/3))
        frameView.backgroundColor = UIColorFromRGB(0xCBD401) //0xCBD401
        self.view.addSubview(frameView)
        
        var label = UILabel(frame: CGRectMake(0, 35, frameView.frame.width, 15))
        label.textAlignment = NSTextAlignment.Center;
        
        label.textColor = UIColor.whiteColor()
        label.text = "Belkosten"
        frameView.addSubview(label)
        
        var infoLabel = UILabel(frame: CGRectMake(40, 50, frameView.frame.width-screenWidth/4, 65))
        infoLabel.textAlignment = NSTextAlignment.Center;

        infoLabel.textColor = UIColor.whiteColor()
        infoLabel.text = "9,4 cent per gesprek plus 2,8 cent per minuut, plus uw gebruikelijke belkosten."
        infoLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        infoLabel.numberOfLines = 0
        frameView.addSubview(infoLabel)
        
        let orignY : CGFloat = frameView.frame.height-90
        let gap : CGFloat = 10
        
        //button dimensions
        let buttonWidth : CGFloat = frameView.frame.width-100
        let buttonHeight : CGFloat = 60
        
        
        let myButton = UIButton()
        myButton.backgroundColor = UIColor.blueColor()
        
        
        myButton.frame = CGRectMake(0, orignY, buttonWidth, buttonHeight)
        myButton.center.x = label.center.x // for horizontal
        myButton.addTarget(self, action: "callAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //Border
        //myButton.layer.borderColor = UIColor.blueColor().CGColor
        //myButton.layer.borderWidth = borderSize
        myButton.layer.cornerRadius = 5
        
        //Image
        let myImage = UIImage(named: "ic_call@3x.png")
        myButton.setImage(myImage, forState: UIControlState.Normal)
        myButton.setImage(UIImage(named: "ic_phone@3x.png"), forState: UIControlState.Highlighted)
        myButton.imageEdgeInsets = UIEdgeInsets(top: gap, left: 0, bottom: gap, right: gap)
        
        //Text
        myButton.setTitle("Bel nu", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 25)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        myButton.backgroundColor = UIColorFromRGB(0x0092BB)
        myButton.titleEdgeInsets = UIEdgeInsets(top: gap, left: gap, bottom: gap, right: 0.0)
        
        frameView.addSubview(myButton)
        
        let cancelButton   = UIButton(type: UIButtonType.System) as UIButton
        cancelButton.frame = CGRectMake(20, screenHeight-325, 120, 25)
        cancelButton.backgroundColor = UIColor(patternImage : UIImage(named: "annuleren_normal@3x.png")!)
        cancelButton.setTitle("Annuleren", forState: UIControlState.Normal)
        cancelButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        cancelButton.addTarget(self, action: "cancelAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(cancelButton)

        
        
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
    
    func cancelAction(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
        myButton.hidden = false

    }
    
    func callAction(sender: UIButton){
        print("calling")
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
