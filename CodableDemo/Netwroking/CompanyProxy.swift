//
//  MovieProxy.swift
//  CodableDemo
//
//  Created by Shantaram K on 10/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class CompanyProxy: APIClient {
    
    static func companyList(_ apiConfiguration: APIConfiguration, successCompletion: @escaping ([CompanyModel]) -> Void, failureCompletion: @escaping (Error) -> Void) {
        
        performRequest(route: apiConfiguration, successCompletion: { (result) in
            
            successCompletion(result)
            
        }, failureCompletion: { (error) in
            
            failureCompletion(error)
        })
    }
    
}
