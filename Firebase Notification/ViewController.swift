//
//  ViewController.swift
//  Firebase Notification
//
//  Created by Ferdi Kızıltoprak on 01/06/16.
//  Copyright © 2016 Ferdi Kızıltoprak. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var logOut: UIBarButtonItem!
    
    let condition = FIRDatabase.database().reference().child("condition")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = logOut
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        condition.observeEventType(.Value) { (snap: FIRDataSnapshot) in
            self.conditionLabel.text = snap.value?.description
        }
    }
    @IBAction func SunnyDidTouch(sender: AnyObject) {
        condition.setValue("Sunny")
    }

    @IBAction func FoggyDidTouch(sender: AnyObject) {
        condition.setValue("Foggy")
    }
    
    @IBAction func logOut(sender: AnyObject) {
        try! FIRAuth.auth()!.signOut()
    }
    
}

