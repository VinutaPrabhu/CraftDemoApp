//
//  APIURLs.swift
//  CraftDemo
//
//  Created by Vinuta Prabhu on 11/03/19.
//  Copyright © 2019 Seven Lakes Enterprises. All rights reserved.
//

import Foundation

struct APIURLs {
    var baseURL: URL!
    
    private struct Savings {
        static let SavingsStatus = "savingsStatus"
    }
    
    var savingsAPIURL: URL {
        return baseURL.appendingPathComponent(Savings.SavingsStatus)
    }
}

