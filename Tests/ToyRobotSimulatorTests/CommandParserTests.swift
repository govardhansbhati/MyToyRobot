//
//  CommandParserTests.swift
//  MyToyRobot
//
//  Created by govardhan singh bhati on 20/08/25.
//


import XCTest
@testable import MyToyRobot

class CommandParserTests: XCTestCase {
    
    func testParseValidPlaceCommand() {
        let command = Command.parse(from: "PLACE 1,2,NORTH")
        guard case let .place(position, direction)? = command else {
            XCTFail("Failed to parse PLACE command")
            return
        }
        XCTAssertEqual(position, Position(x: 1, y: 2))
        XCTAssertEqual(direction, .NORTH)
    }
    
    func testParsePlaceCommandWithExtraSpaces() {
        let command = Command.parse(from: "PLACE   0, 0,  SOUTH") 
        XCTAssertNil(command, "Parser should not handle complex whitespace")
        // A more robust parser could be built, but for this exercise we follow a strict format.
    }

    func testParseSimpleCommands() {
        XCTAssertNotNil(Command.parse(from: "MOVE"))
        XCTAssertNotNil(Command.parse(from: "LEFT"))
        XCTAssertNotNil(Command.parse(from: "RIGHT"))
        XCTAssertNotNil(Command.parse(from: "REPORT"))
    }
    
    func testParseLowercaseCommands() {
        let command = Command.parse(from: "place 0,0,west")
        guard case let .place(position, direction)? = command else {
            XCTFail("Failed to parse lowercase place command")
            return
        }
        XCTAssertEqual(position, Position(x: 0, y: 0))
        XCTAssertEqual(direction, .WEST)
        
        XCTAssertNotNil(Command.parse(from: "move"))
    }

    func testParseInvalidCommands() {
        XCTAssertNil(Command.parse(from: "JUMP"))
        XCTAssertNil(Command.parse(from: "PLACE 1,2"))
        XCTAssertNil(Command.parse(from: "PLACE 1,2,UP"))
        XCTAssertNil(Command.parse(from: "PLACE A,B,NORTH"))
        XCTAssertNil(Command.parse(from: ""))
    }
}
