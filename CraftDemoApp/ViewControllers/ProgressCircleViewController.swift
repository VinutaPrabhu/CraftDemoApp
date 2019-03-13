//
//  ProgressCircleViewController.swift
//  CraftDemo
//
//  Created by Vinuta Prabhu on 09/03/19.
//  Copyright © 2019 Seven Lakes Enterprises. All rights reserved.
//

import UIKit
import CraftDemoFramework

class ProgressCircleViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        dateLabel.text = "As of \(formatter.string(from: Date()))"
    }
}
