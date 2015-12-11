//
//  ProfileViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Brian Kwon on 12/9/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let user = UserModel()

    @IBOutlet weak var profileImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.user.storeFBDataIntoParse("jMt6rG3GGk", accessToken: "CAAGyoLTet0IBAHysCqVQv3HtaO6SK72Gs1hZCbVfLLxVKTL72h8WF5mAWje4sDSicXFAJDGb72WyarG4eOXZCQbVtIBSTglcaUmlQP1vxnCknDVZBmzQJ3f9KoGRS6N9MvVDrQcPs1CDZBLLs2RsdtjL8g0XZB3LMUbFoymZAVSGm86JuonZC5UcCLMdhQnQN0uzzhEIip0diTsDoBa9lbKRpDgMnOtgLX3k1jikv4KZAkbGFon0ONwhTeThsSHGS9MZD") { () -> Void in
            print (self.user.name)
            print (self.user.photo)
        }
        
        // Do any additional setup after loading the view.
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var userName: UILabel!



}
