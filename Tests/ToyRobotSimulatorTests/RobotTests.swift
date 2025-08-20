//
//  RobotTests.swift
//  MyToyRobot
//
//  Created by govardhan singh bhati on 20/08/25.
//


import XCTest
@testable import MyToyRobot

class RobotTests: XCTestCase {
    var robot: Robot!

    override func setUp() {
        super.setUp()
        robot = Robot()
    }

    func testRobotIsNotPlacedInitially() {
        XCTAssertFalse(robot.isPlaced)
        XCTAssertNil(robot.report())
    }

    func testPlacingRobot() {
        robot.place(at: Position(x: 1, y: 2), facing: .EAST)
        XCTAssertTrue(robot.isPlaced)
        XCTAssertEqual(robot.report(), "1,2,EAST")
    }

    func testIgnoringCommandsBeforePlacement() {
        robot.move()
        XCTAssertFalse(robot.isPlaced)
        
        robot.turnLeft()
        XCTAssertFalse(robot.isPlaced)
        
        robot.turnRight()
        XCTAssertFalse(robot.isPlaced)
        
        XCTAssertNil(robot.report())
    }
    
    func testMoveCommand() {
        robot.place(at: Position(x: 1, y: 1), facing: .NORTH)
        robot.move()
        XCTAssertEqual(robot.report(), "1,2,NORTH")
    }
    
    func testTurnLeftCommand() {
        robot.place(at: Position(x: 0, y: 0), facing: .NORTH)
        robot.turnLeft()
        XCTAssertEqual(robot.report(), "0,0,WEST")
        robot.turnLeft()
        XCTAssertEqual(robot.report(), "0,0,SOUTH")
        robot.turnLeft()
        XCTAssertEqual(robot.report(), "0,0,EAST")
        robot.turnLeft()
        XCTAssertEqual(robot.report(), "0,0,NORTH")
    }

    func testTurnRightCommand() {
        robot.place(at: Position(x: 0, y: 0), facing: .NORTH)
        robot.turnRight()
        XCTAssertEqual(robot.report(), "0,0,EAST")
        robot.turnRight()
        XCTAssertEqual(robot.report(), "0,0,SOUTH")
        robot.turnRight()
        XCTAssertEqual(robot.report(), "0,0,WEST")
        robot.turnRight()
        XCTAssertEqual(robot.report(), "0,0,NORTH")
    }
    
    func testReportAfterMultipleCommands() {
        robot.place(at: Position(x: 1, y: 2), facing: .EAST)
        robot.move()
        robot.move()
        robot.turnLeft()
        robot.move()
        XCTAssertEqual(robot.report(), "3,3,NORTH")
    }
}
