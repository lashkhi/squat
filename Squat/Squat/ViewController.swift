//
//  ViewController.swift
//  Squat
//
//  Created by David Lashkhi on 17/10/2016.
//  Copyright © 2016 David Lashkhi. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    let manager = CMMotionManager()
    var isCounting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if manager.isDeviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.5
            let queue = OperationQueue()
            manager.startDeviceMotionUpdates(to: queue, withHandler: {
                (data: CMDeviceMotion?, error: Error?) in
                if let acceleration = data?.userAcceleration , let gravity = data?.gravity {
                    NSLog("Y:\(acceleration.y), Y Gravity:\(gravity.y)")
                    self.detectSquat(acceleration: acceleration.y , gravity: gravity.y)

                }
                
            })
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func detectSquat(acceleration: Double, gravity: Double) {
        if acceleration > 0.15 && acceleration < 0.7 {
            if isCounting {
                DispatchQueue.main.async {
                    NSLog("COUNT")
                    self.isCounting = false
                    let counter = Int(self.counterLabel.text!)! + 1
                    self.counterLabel.text = String(counter)
                }
            }
            else { isCounting = true }
        }
    }

}

