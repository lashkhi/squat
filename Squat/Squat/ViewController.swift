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
    let alimeter = CMAltimeter()
    let activityManager = CMMotionActivityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = OperationQueue()
        
        if CMAltimeter.isRelativeAltitudeAvailable() {
            alimeter.startRelativeAltitudeUpdates(to: queue, withHandler: {
                [weak self](data: CMAltitudeData?, error: Error?) in
                if let altitude = data?.relativeAltitude {
                    self?.calculateRelativeAltitude(altitude: altitude)
                }
            })
        }
        
        if CMMotionActivityManager.isActivityAvailable() {
            activityManager.startActivityUpdates(to: queue, withHandler: {
                (activityData: CMMotionActivity?) in
                //
            })
        }
        
        /*if manager.isDeviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.1
            manager.startDeviceMotionUpdates(to: queue, withHandler: {
                (data: CMDeviceMotion?, error: Error?) in
                if let acceleration = data?.userAcceleration {
                    //NSLog("X:\(acceleration.x), Y:\(acceleration.y), Z:\(acceleration.z)")
                }
                if let gravity = data?.gravity {
                    NSLog("X:\(gravity.x), Y:\(gravity.y), Z:\(gravity.z)")

                }
                
            })
            
            
            
        }*/
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func calculateRelativeAltitude(altitude: NSNumber)  {
        NSLog("\(altitude)")

    }

}

