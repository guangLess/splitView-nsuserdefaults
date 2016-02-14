//
//  ViewController.swift
//  SplitViewExample
//
//  Created by Guang on 2/13/16.
//  Copyright © 2016 Guang. All rights reserved.
//

import UIKit

class SplitVCExampleViewController: UIViewController {
    
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)

    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destionVC = segue.destinationViewController as? UIViewController
        
        if let navCon = destionVC as? UINavigationController {
            destionVC = navCon.visibleViewController
        }
        
        if let svc = destionVC as? SmileViewController{
            if let identifier = segue.identifier{
                switch identifier {
                case "full": svc.happiness = 0
                case "hope": svc.happiness = 100
                case "happy" :svc.happiness = 50
                case "nothing":svc.happiness = 65
                default: svc.happiness = 79
                }
            }
        }
    }

}

