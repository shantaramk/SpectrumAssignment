//
//  APITests.swift
//  CodableDemoTests
//
//  Created by Shantaram K on 10/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import XCTest
@testable import CodableDemo

class APITests: XCTestCase {
 
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
}

//MARK: - Test API

extension APITests {
    
    func testMovieListAPI() {
        
        let viewModel = CompanyViewModel()
        
        let expectation = self.expectation(description: "Test Movie API")
        
        CompanyProxy.companyList(APIConfiguration(), successCompletion: { (result) in
            
            viewModel.companyList = result
            
            expectation.fulfill()

        }) { (error) in
            print(error)
        }
        
        waitForExpectations(timeout: 30) { (error) in
            
            XCTAssertNotNil(viewModel.companyList)
            
            XCTAssertEqual(viewModel.companyList.first?.name, "GYNKO")
        }
    }
}
