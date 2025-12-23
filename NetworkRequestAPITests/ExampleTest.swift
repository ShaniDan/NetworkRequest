//
//  ExampleTest.swift
//  NetworkRequestAPITests
//
//  Created by Shakhnoza Mirabzalova on 12/23/25.
//

import Testing
@testable import NetworkRequestAPI

@MainActor
struct ExampleTest {

    @Test func checkingTest() async throws {
        // arrange act assert
        // given when then
        // arange, given
        let sut = Example()
        
        // act, when
        let result = sut.checkingTest(num: 1)
        let result2 = sut.checkingTest(num: 2)
        let result3 = sut.checkingTest(num: 3)
        let result4 = sut.checkingTest(num: 4)
        let result5 = sut.checkingTest(num: 5)
        
        
        // assert, then
        #expect(result == "1")
        #expect(result2 == "2")
        #expect(result3 == "fizz")
        #expect(result4 == "4")
        #expect(result5 == "buzz")
    }
    
    @Test func asdf() {
        // given
        
        // when
        
        // then
    }
}
