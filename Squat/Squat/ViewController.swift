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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = CMMotionManager()
        if manager.isGyroAvailable {
            manager.gyroUpdateInterval = 0.1
            manager.startGyroUpdates()
            
            let queue = OperationQueue.main
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func startCounting() {
        
    }

}

