//
//  UserModel.swift
//  ParseStarterProject-Swift
//
//  Created by Brian Kwon on 12/9/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import Foundation
import ParseFacebookUtilsV4


/*
Create a model class

Add http requests to FB parse database
*/

class UserModel {
    
    var name: String?
    var gender: String?
    var photo: PFFile?
    var age: Int?
    var employer: String?
    var jobTitle: String?
    var education: String?

    //function -> void
     //name = from api request
    func storeFBDataIntoParse(objectId: String, accessToken: String, completion: (() -> Void)!) {
        
        let request = FBSDKGraphRequest(graphPath:"me?fields=id,name,gender,education,picture,work,birthday", parameters:nil)
        
        // Send request to Facebook
        request.startWithCompletionHandler {
            
            (connection, result, error) in
            
            if error != nil {
                // Some error checking here
            }
            else if let userData = result as? [String:AnyObject] {
                
                // Access user data
                print(userData)
                self.name = userData["name"] as! String
                self.gender = userData["gender"] as! String
//                self.getAgeFromFBBirthday(String(userData["birthday"], completion: { (age) -> Void in
//                    self.age = age
//                }))
                
                    
                if userData["work"] != nil && userData["work"]![0]["employer"] != nil {
                    self.employer = userData["work"]![0]["employer"]!!["name"] as! String
                }
                
                if userData["work"] != nil && userData["work"]![0]["position"] != nil {
                    self.jobTitle = userData["work"]![0]["position"]!!["name"] as! String
                }
                
                if userData["education"] != nil {
                    for var i = 0; i < userData["education"]!.count; i++ {
                        if userData["education"]![i]["type"] as! String == "College" {
                            self.education = userData["education"]![i]["school"]!!["name"] as! String
                        }
                    }
                }
                print(accessToken)
                let url = NSURL(string: "https://graph.facebook.com/me/picture?type=large&return_ssl_resources=1&access_token="+String(accessToken))
                
                if let data = NSData(contentsOfURL: url!) {
                    print(data)
                    var imageData = UIImagePNGRepresentation(UIImage(data:data)!)
                    var imageFile = PFFile(data: imageData!)
                    self.photo = imageFile
                }
                completion()
                print(self.name)
                print(self.gender)

                print(self.photo)

                print(self.employer)

                print(self.education)
                
                

                
                    
                    let query = PFQuery(className:"_User")
                    query.getObjectInBackgroundWithId(objectId) {
                        (user: PFObject?, error: NSError?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let user = user {
                            user["name"] = self.name!
                            user["gender"] = self.gender!
                            user["education"] = self.education!
                            user["photo"] = self.photo

                            user.saveInBackground()
                        }
                    }
                
            }
        }
    }
    func getUserInfo() {
        
    }
    
    func getAgeFromFBBirthday(birthdate: String!, completion: ((age: Int) -> Void)!) {
        
        let bDayComponents = NSDateComponents()
        
        var NSStringBday = birthdate as NSString
        
        bDayComponents.year = Int(NSStringBday.substringWithRange(NSRange(location: 6, length: 4)))!
        bDayComponents.month = Int(NSStringBday.substringWithRange(NSRange(location: 0, length: 2)))!
        bDayComponents.day = Int(NSStringBday.substringWithRange(NSRange(location: 3, length: 2)))!
        
        var yearsOld: Double
        
        if let bDate = NSCalendar.currentCalendar().dateFromComponents(bDayComponents) {
            yearsOld = Double(NSDate().timeIntervalSince1970) - Double(bDate.timeIntervalSince1970)
            yearsOld = yearsOld/60/60/24/365
            completion(age: Int(yearsOld))
        }
    }
}

//var brian = new userModel
//brian.function
//brian.name