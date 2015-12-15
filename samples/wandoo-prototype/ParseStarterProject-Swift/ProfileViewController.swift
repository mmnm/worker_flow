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
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "profile"))
        
        let btnName = UIButton()
        btnName.setImage(UIImage(named: "setting"), forState: .Normal)
        btnName.frame = CGRectMake(0, 0, 30, 30)
        btnName.addTarget(self, action: "buttonAction:", forControlEvents: .TouchUpInside)

        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnName
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        self.user.storeFBDataIntoParse("GvNZq4udhT", accessToken: "CAAGyoLTet0IBAHysCqVQv3HtaO6SK72Gs1hZCbVfLLxVKTL72h8WF5mAWje4sDSicXFAJDGb72WyarG4eOXZCQbVtIBSTglcaUmlQP1vxnCknDVZBmzQJ3f9KoGRS6N9MvVDrQcPs1CDZBLLs2RsdtjL8g0XZB3LMUbFoymZAVSGm86JuonZC5UcCLMdhQnQN0uzzhEIip0diTsDoBa9lbKRpDgMnOtgLX3k1jikv4KZAkbGFon0ONwhTeThsSHGS9MZD") { () -> Void in
            print (self.user.name)
            print (self.user.photo)
            
            self.name.text = String(self.user.id!)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func buttonAction(send: UIButton!) {
        self.performSegueWithIdentifier("toSettingsController", sender: self)
    }

    
    @IBOutlet weak var userName: UILabel!



}
