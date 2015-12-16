//
//  PostViewController.swift
//  ParseStarterProject-Swift
//
//  Created by William Lee on 12/15/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let postButton : UIBarButtonItem = UIBarButtonItem(title: "Post", style: UIBarButtonItemStyle.Done, target: self, action: "buttonAction:")
        self.navigationItem.rightBarButtonItem = postButton
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonAction(send: UIButton!) {
        self.performSegueWithIdentifier("toWandooController", sender: self)
    }

    @IBAction func cancelPeopleUnwind(segue:UIStoryboardSegue) {
    }    
    
    @IBAction func submitPeopleUnwind(segue:UIStoryboardSegue) {
    }
    
    @IBAction func cancelTimeUnwind(segue:UIStoryboardSegue) {
    }
    
    @IBAction func submitTimeUnwind(segue:UIStoryboardSegue) {
    }
    
    @IBAction func cancelLocationUnwind(segue:UIStoryboardSegue) {
    }
    
    @IBAction func submitLocationUnwind(segue:UIStoryboardSegue) {
    }
    
    
}