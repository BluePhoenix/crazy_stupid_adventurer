//
//  ViewController.swift
//  Crazy_Stupid_Adventurer
//
//  Created by Michael Hardin on 5/4/16.
//  Copyright © 2016 Michael Hardin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var brickView: UIView!
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

    
//    @IBAction func openPressed(sender: AnyObject) {
//        if imageView.image == UIImage(named: "s11"){
//          imageView.image = UIImage(named: "s12")
//        }else {
//            imageView.image = UIImage(named: "s11")
//        }
//    }
    @IBAction func brickTapped(sender: AnyObject) {
        print("brick tapped")
        if imageView.image == UIImage(named: "s1Start"){
            let alertController = UIAlertController(title: "Brick", message: "Select an action", preferredStyle: .Alert)
            
            let hitAction = UIAlertAction(title: "Punch", style: UIAlertActionStyle.Default){ UIAlertAction in
            self.messageLabel.text = "your hand is likely broken way to go"
            }
            
            let pullAction = UIAlertAction(title: "Pull", style: UIAlertActionStyle.Default){ UIAlertAction in
                self.messageLabel.text = "the loose brick is removed"
                self.imageView.image = UIImage(named: "s1BrickOpened")
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
                UIAlertAction in
                
            }
            alertController.addAction(hitAction)
            alertController.addAction(pullAction)
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        if imageView.image == UIImage(named: "s1BrickOpened"){
            let alertController = UIAlertController(title: "Brick", message: "Select an action", preferredStyle: .Alert)
            
            let takeAction = UIAlertAction(title: "Take Key", style: UIAlertActionStyle.Default){ UIAlertAction in
                self.messageLabel.text = "You take the key"
               self.imageView.image = UIImage(named: "s1keyTaken")
            }
            alertController.addAction(takeAction)
           
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }

    }
    @IBAction func doorViewTapped(sender: AnyObject) {
        if imageView.image == UIImage(named: "s1Start"){
        let alertController = UIAlertController(title: "Door", message: "Select an action", preferredStyle: .Alert)
        
        // Create the actions
        let openAction = UIAlertAction(title: "Open", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            //self.openPressed(sender)
            self.messageLabel.text = "the door is locked"
           
        }
        let knockAction = UIAlertAction(title: "Knock", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.messageLabel.text = "no one answers"
          
        }
        let kickAction = UIAlertAction(title: "Kick in", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.imageView.image = UIImage(named: "s1DoorKickedOpen")
            self.messageLabel.text = "you kick the door in. that was a bit much dont you think?"
           
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            
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
        
        if imageView.image == UIImage(named: "s1DoorUnlocked"){
            performSegueWithIdentifier("toScene2", sender: self)
        }
        if imageView.image == UIImage(named: "s1keyTaken"){
            imageView.image = UIImage(named: "s1DoorUnlocked")
            self.messageLabel.text = "You have unlocked the door"
        }
        if imageView.image == UIImage(named: "s1DoorKickedOpen"){
            imageView.image = UIImage(named: "hades")
            self.messageLabel.text = "you are dead. you have to be a moron to break and enter at death castle"
        }
        
        
    }
}

