//
//  ViewController.swift
//  TwoDate
//
//  Created by Chris Falvo on 3/28/16.
//  Copyright © 2016 Chris Falvo. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ViewController: UIViewController {

    @IBOutlet weak var menButton: UIButton!
    @IBOutlet weak var womenButton: UIButton!
    
    
    var preferMen = false
    var preferWomen = false
    
    @IBAction func menButtonTapped(sender: AnyObject) {
        if preferMen == false {
            menButton.setImage(UIImage(named: "menChecked"), forState:.Normal)
            womenButton.setImage(UIImage(named: "womenUnchecked"), forState:.Normal)
            preferMen = true
            preferWomen = false
        } else {
            menButton.setImage(UIImage(named: "menUnchecked"), forState:.Normal)
            preferMen = false
        }
        
    }
    
    @IBAction func womenButtonTapped(sender: AnyObject) {
        if preferWomen == false {
            womenButton.setImage(UIImage(named: "womenChecked"), forState:.Normal)
            menButton.setImage(UIImage(named: "menUnchecked"), forState:.Normal)
            preferWomen = true
            preferMen = false
        } else {
            womenButton.setImage(UIImage(named: "womenUnchecked"), forState:.Normal)
            preferWomen = false
        }
    
    }
    
    var choice: String = ""
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextVC = segue.destinationViewController as! PersonVC
        if preferMen == true {
            nextVC.choice = "men"
        
        } else if preferWomen == true {
            nextVC.choice = "women"
            
        } else {
                let alertController = UIAlertController(title: "Please select a gender to show.", message: nil, preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (UIAlertAction) in
                    //nothing
                }))
                
                self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

