//
//  StatusViewController.swift
//  CraftDemo
//
//  Created by Vinuta Prabhu on 09/03/19.
//  Copyright © 2019 Seven Lakes Enterprises. All rights reserved.
//

import UIKit
import CraftDemoFramework

class StatusViewController: UIViewController {
    @IBOutlet weak var statusStackView: StatusStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.borderColor = UIColor.cyan.cgColor
        view.layer.borderWidth = 2
    }
}
