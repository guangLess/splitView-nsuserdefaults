//
//  SmileViewController.swift
//  bezierPath-simple
//
//  Created by Guang on 2/10/16.
//  Copyright © 2016 Guang. All rights reserved.
//

import UIKit

class SmileViewController: UIViewController, FaceViewDataSource
{
    
    @IBOutlet weak var faceView: smileView! {
        didSet{
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
            
        }
    }
    
    private struct Constants{
        static let SmileGestureScale: CGFloat = 4
    }
    @IBAction func changeSmile(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let smileChange = -Int(translation.y / Constants.SmileGestureScale)
            if smileChange != 0 {
                happiness+=smileChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default:break
        }
    }

    var happiness : Int = 100 {
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    func updateUI(){
        faceView?.setNeedsDisplay() // needs to be optional otherwise there is nothing to update when first start
        title = "\(happiness)"
    }
    
    func smileinessForFaceView(sender: smileView) -> Double? {
        return Double(happiness-50)/50
    }
}
