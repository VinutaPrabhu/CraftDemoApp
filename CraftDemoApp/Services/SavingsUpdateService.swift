//
//  SavingsUpdateService.swift
//  CraftDemoApp
//
//  Created by Vinuta Prabhu on 13/03/19.
//  Copyright © 2019 Seven Lakes Enterprises. All rights reserved.
//

import Foundation
import CraftDemoFramework

protocol SavingsUpdateServiceProtocol {
    func updateSavingsStatus()
}

class SavingsUpdateService: SavingsUpdateServiceProtocol {
    private var savingsAPIService = SavingsAPIService(baseUrl: "http://localhost:3000")
    private var timer: Timer?
    
    init() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.updateSavingsStatus()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(updateSavingsStatus), userInfo: nil, repeats: true)
    }
    
    deinit {
        timer?.invalidate()
    }
    
    @objc func updateSavingsStatus() {
        savingsAPIService.getMySavingsStatus(onSuccess: { (data) in
            SavingsInfoService.sharedInstance.savingsInfoDidUpdate(data)
        }) { (error) in
            print("An error occurred while fetching service status")
        }
    }
}
