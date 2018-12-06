//
//  BoxesTests.swift
//  BoxesTests
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import XCTest
@testable import Boxes

class BoxesTests: XCTestCase {
    
    // MARK: - Properties
    let api = RESTManager.shared

    // MARK: - Setup
    override func setUp() {}

    override func tearDown() {}

    // MARK: - Tests
    func testFetchUsers() {
        let requestExpectation = expectation(description: "Fetch Users Request")
        
        api.makeRequest(from: "/api/users?page=1", httpBody: nil) { (_ response: UsersResponse?, _ error: Error?) in
            requestExpectation.fulfill()
            
            if let response = response {
                XCTAssertNotNil(response, "✅ Fetching users successful")
                XCTAssertTrue(response.data.count > 0, "✅ Fetching users successful")
            }
        }
        
        waitForExpectations(timeout: 5, handler: { (error) in
            if error != nil {
                XCTFail("🛑 Request timed out")
            }
        })
    }
    
}
