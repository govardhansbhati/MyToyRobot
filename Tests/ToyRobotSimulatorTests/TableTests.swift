//
//  TableTests.swift
//  MyToyRobot
//
//  Created by govardhan singh bhati on 20/08/25.
//


import XCTest
@testable import MyToyRobot

class TableTests: XCTestCase {
    func testIsValidPosition() {
        let table = Table(width: 5, height: 5)
        
        // Test corners
        XCTAssertTrue(table.isValid(position: Position(x: 0, y: 0)))
        XCTAssertTrue(table.isValid(position: Position(x: 4, y: 4)))
        XCTAssertTrue(table.isValid(position: Position(x: 0, y: 4)))
        XCTAssertTrue(table.isValid(position: Position(x: 4, y: 0)))
        
        // Test center
        XCTAssertTrue(table.isValid(position: Position(x: 2, y: 2)))
        
        // Test invalid positions (out of bounds)
        XCTAssertFalse(table.isValid(position: Position(x: -1, y: 0)))
        XCTAssertFalse(table.isValid(position: Position(x: 0, y: -1)))
        XCTAssertFalse(table.isValid(position: Position(x: 5, y: 0)))
        XCTAssertFalse(table.isValid(position: Position(x: 0, y: 5)))
    }
}
