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

    var locationManager = CLLocationManager()
    var userModel = UserModel.sharedUserInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        print(userModel.name)
        
        self.navigationItem.hidesBackButton = true
//        self.tabBarController?.navigationItem.hidesBackButton = true

    }
    
//    override func viewDidAppear(animated: Bool) {
//        self.navigationItem.hidesBackButton = true
//    }

    
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
