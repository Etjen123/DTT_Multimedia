//
//  RSRPechhulpViewController.swift
//  DTTMultimedia
//
//  Created by Etjen Ymeraj on 4/26/16.
//  Copyright © 2016 Etjen Ymeraj. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


let myButton = UIButton()

class RSRPechhulpViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

     var mapView = MKMapView()

    
    
      var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        //assign to variables
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height

        
        //mapView.mapType = .Standard
        mapView.frame = view.frame
        mapView.zoomEnabled = true
        mapView.scrollEnabled = true
        mapView.delegate = self
        view.addSubview(mapView)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //gps
        
        locationManager.requestWhenInUseAuthorization() //only when we use the app
        locationManager.startUpdatingLocation()
        
        
        
        mapView.showsUserLocation = true
        //mapView.delegate = self
        
        //create a navigation bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, screenWidth, screenHeight/10))
        
        //navigationBar.backgroundColor = UIColor.whiteColor()
        //navigationBar.delegate = self;
        
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationBar.barTintColor = UIColorFromRGB(0x0092BB) 
        navigationBar.tintColor = UIColor.whiteColor()
        
        navigationItem.title = "RSR Pechhulp"
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
        
        
        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)


        // Do any additional setup after loading the view.
        
        let orignY : CGFloat = screenHeight-100
        let gap : CGFloat = 10
        
        //button dimensions
        let buttonWidth : CGFloat = screenWidth-30
        let buttonHeight : CGFloat = 60
        
        
        myButton.backgroundColor = UIColor.blueColor()
        myButton.hidden = false
        
        myButton.frame = CGRectMake(0, orignY, buttonWidth, buttonHeight)
        myButton.center.x = self.view.center.x // for horizontal
        myButton.addTarget(self, action: "popAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //Border
        //myButton.layer.borderColor = UIColor.blueColor().CGColor
        //myButton.layer.borderWidth = borderSize
        myButton.layer.cornerRadius = 5
        
        //Image
        let myImage = UIImage(named: "ic_phone@3x.png")
        myButton.setImage(myImage, forState: UIControlState.Normal)
        myButton.setImage(UIImage(named: "ic_phone@3x.png"), forState: UIControlState.Highlighted)
        myButton.imageEdgeInsets = UIEdgeInsets(top: gap, left: 0, bottom: gap, right: gap)
        
        //Text
        myButton.setTitle("bel RSR nu", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 25)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        myButton.backgroundColor = UIColorFromRGB(0x0092BB)
        myButton.titleEdgeInsets = UIEdgeInsets(top: gap, left: gap, bottom: gap, right: 0.0)
        
        view.addSubview(myButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
       let location = locations.last
        var center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta:  0.01))
        
        self.mapView.setRegion(region, animated: true)
        
        loadAnnotationsInMap(center, title: "A", subtitle: "b")
        locationManager.startUpdatingLocation()
        
        
        
    }
    
    func backButtonPressed(){
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    override func viewDidAppear(animated: Bool) {
        myButton.hidden = false
    }
    

    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func popAction(sender:UIButton!){
        
        var controller = PopUpViewController()
        print("Button tapped")
        controller.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        sender.hidden = true
        self.presentViewController(controller, animated: true, completion: nil)

        
    }
    
    
    func loadAnnotationsInMap(point: CLLocationCoordinate2D, title: String, subtitle: String){
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = point
        
        annotation.title = title
        annotation.subtitle = subtitle
        
        mapView.addAnnotation(annotation)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        
        
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("pin")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView!.canShowCallout = true
        }
        else {
            annotationView!.annotation = annotation
        }
        
        annotationView!.image = UIImage(named: "marker@3x.png")
        
        return annotationView
        
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
