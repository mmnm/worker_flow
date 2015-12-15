/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse
import FBSDKCoreKit
import ParseFacebookUtilsV4
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
//        //self.navigationController?.navigationBar.frame = CGRectMake(0, 0, 30, 30)
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)

    var locationManager = CLLocationManager()
    var userModel = UserModel.sharedUserInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController!.navigationBar.barTintColor = UIColor(red:0.20, green:0.60, blue:0.86, alpha:1.0)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        print(userModel.name)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0]
        
//        var lat:Double {
//            get {
//                toPass.latitude = latitude
//                print(toPass.latitude)
//                return latitude
//            }
//            set {
//                latitude = Double(userLocation.coordinate.latitude)
//            }
//        }
//        
//        var long:Double {
//            get {
//                toPass.longitude = longitude
//                return longitude
//            }
//            set {
//                longitude = Double(userLocation.coordinate.longitude)
//            }
//        }
        
        
        //userLocation - there is no need for casting, because we are now using CLLocation object

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
