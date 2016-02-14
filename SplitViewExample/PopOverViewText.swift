//
//  popOverViewText.swift
//  SplitViewExample
//
//  Created by Guang on 2/13/16.
//  Copyright © 2016 Guang. All rights reserved.
//

import UIKit

class PopOverViewText : SmileViewController, UIPopoverPresentationControllerDelegate
{
    override var happiness: Int {
        didSet{
            popOverHistory += [happiness]
        }
    }
    
    
    
    
    
   // var popOverHistory = [Int]()
    private let defaults = NSUserDefaults.standardUserDefaults()
    var popOverHistory: [Int] {
        get { return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? [] }
        set { defaults.setObject(newValue, forKey: History.DefaultsKey)}
    }


    private struct History {
        static let segueId = "show history"
        static let DefaultsKey = "PopOverViewController.Hisotry"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.segueId:
                if let tvc = segue.destinationViewController as? TextViewController{
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(popOverHistory)"
                }
            default : break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
}

