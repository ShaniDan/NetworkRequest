//
//  NetworkRequestAPITests.swift
//  NetworkRequestAPITests
//
//  Created by Shakhnoza Mirabzalova on 12/21/25.
//

import Testing
import XCTest
@testable import NetworkRequestAPI

struct NetworkRequestAPITests {

    @Test func testCatInfoDecoding() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let json = """
        {
            "id": "cat_123",
            "url": "https://example.com/cat.jpg",
            "width": 640,
            "height": 480
        }
        """.data(using: .utf8)!
        
        let catInfo = try JSONDecoder().decode(CatInfo.self, from: json)
        
        XCTAssertEqual(catInfo.id, "")
        XCTAssertEqual(catInfo.image, "")
        XCTAssertEqual(catInfo.width, 640)
        XCTAssertEqual(catInfo.width, 480)
    }

}
