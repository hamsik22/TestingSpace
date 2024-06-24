//
//  WhatIsXCTest.swift
//  TestingSpaceTests
//
//  Created by 황석현 on 4/10/24.
//
import XCTest
import Foundation

// MARK: 테스트할 객체를 호출할 수 있다.
//@testable import TestingSpace

/**
 이 파일은..
 XCTest를 어떻게하면 사용할 수 있는지
 XCTest란 무엇인지
 에 대해서 잊어버리지 않기 위헤 기록한 파일이다.
 */

/*
 모의객체와 가짜객체를 활용하여 테스트의 독립성을 높이고
 보다 간단하고 안전하게 테스트가 가능하다.
 */

final class WhatIsXCTest: XCTestCase {
    
    // 모든 테스트는 함수로 진행된다.
    // 함수 안에서 테스트하고자 하는 데이터를 생성하고 원하는 결과를 Assert메서드를 통해 확인한다.
    
    // Assert 메서드는 예상하는 결과가 나오지 않으면 에러문구를 출력하는 메서드들로 이루어져 있다.

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testDefalutFuntion() throws {
        let testClass = TestFunction()
        
        XCTAssertEqual(testClass.getSum(num1: 1, num2: 2), 3, "It's Not 3")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class TestFunction {
    
    func getSum(num1: Int, num2: Int) -> Int {
        num1 + num2
    }
    
    func getSub(num1: Int, num2: Int) -> Int {
        num1 - num2
    }
    
    func getMul(num1: Int, num2: Int) -> Int {
        num1 * num2
    }
    
}
