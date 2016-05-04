//
//  ViewController.swift
//  Crazy_Stupid_Adventurer
//
//  Created by Michael Hardin on 5/4/16.
//  Copyright © 2016 Michael Hardin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var doorView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func openPressed(sender: AnyObject) {
        if imageView.image == UIImage(named: "s1doorclosed"){
          imageView.image = UIImage(named: "s1dooropen")
        }else {
            imageView.image = UIImage(named: "s1doorclosed")
        }
    }
    @IBAction func doorViewTapped(sender: AnyObject) {
        if imageView.image == UIImage(named: "s1doorclosed"){
        let alertController = UIAlertController(title: "Door", message: "Select an action", preferredStyle: .ActionSheet)
        
        // Create the actions
        let openAction = UIAlertAction(title: "Open", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            //self.openPressed(sender)
            self.messageLabel.text = "the door is locked"
            NSLog("OK Pressed")
        }
        let knockAction = UIAlertAction(title: "Knock", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.messageLabel.text = "no one answers"
            NSLog("Knock Pressed")
        }
        let kickAction = UIAlertAction(title: "Kick in", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.openPressed(sender)
            self.messageLabel.text = "you kick the door in. that was a bit much dont you think?"
            NSLog("Knock Pressed")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        // Add the actions
        alertController.addAction(openAction)
        alertController.addAction(knockAction)
        alertController.addAction(kickAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
        //openPressed(sender)
        }
        if imageView.image == UIImage(named: "s1dooropen"){
            imageView.image = UIImage(named: "hades")
            self.messageLabel.text = "you are dead. you have to be a moron to break and enter at death castle"
        }
    }
}

