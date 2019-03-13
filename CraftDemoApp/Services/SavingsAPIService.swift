//
//  SavingsAPIService.swift
//  CraftDemo
//
//  Created by Vinuta Prabhu on 11/03/19.
//  Copyright © 2019 Seven Lakes Enterprises. All rights reserved.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol SavingsAPIProtocol {
    func getMySavingsStatus(onSuccess successBlock: @escaping (Data) -> Void, onFailure failureBlock:@escaping ((Error?) -> Void))
}

class SavingsAPIService: SavingsAPIProtocol {
    private var urlSession: URLSession!
    private var apiURLs: APIURLs!
    
    convenience init(baseUrl: String) {
        self.init()
        urlSession = URLSession(configuration: .default)
        apiURLs = APIURLs(baseURL: URL(string: baseUrl))
    }
    
    func getMySavingsStatus(onSuccess successBlock: @escaping (Data) -> Void, onFailure failureBlock: @escaping ((Error?) -> Void)) {
        let url = apiURLs.savingsAPIURL
        var request = URLRequest.init(url: url)
        request.httpMethod = RequestMethod.get.rawValue
        
        makeAPIRequest(with: request, onSuccess: { (data) in
            successBlock(data)
        }, onFailure: failureBlock)
    }
    
    // MARK: API request helper
    
    private func makeAPIRequest(with request: URLRequest, onSuccess successBlock: @escaping (Data) -> Void, onFailure failureBlock: @escaping ((Error?) -> Void)) {
        urlSession.dataTask(with: request) { (data, response, error) in
            guard error == nil, let httpResponse = response as? HTTPURLResponse else {
                failureBlock(nil)
                return
            }
            
            if httpResponse.statusCode == 304 { return }
            
            guard httpResponse.statusCode == 200, let jsonData = data else {
                failureBlock(nil)
                return
            }
            
            successBlock(jsonData)
            }.resume()
    }
}
