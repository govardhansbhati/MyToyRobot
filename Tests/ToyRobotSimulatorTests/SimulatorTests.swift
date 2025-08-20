//
//  SimulatorTests.swift
//  MyToyRobot
//
//  Created by govardhan singh bhati on 20/08/25.
//

// These are integration tests for the main Simulator class.

import XCTest
@testable import MyToyRobot

class SimulatorTests: XCTestCase {
    var simulator: Simulator!

    override func setUp() {
        super.setUp()
        simulator = Simulator()
    }

    func testExampleA() {
        simulator.execute(commandString: "PLACE 0,0,NORTH")
        simulator.execute(commandString: "MOVE")
        
        // MODIFICATION: Accessing the robot property directly.
        XCTAssertEqual(simulator.robot.report(), "0,1,NORTH")
    }

    func testExampleB() {
        simulator.execute(commandString: "PLACE 0,0,NORTH")
        simulator.execute(commandString: "LEFT")
        XCTAssertEqual(simulator.robot.report(), "0,0,WEST")
    }

    func testExampleC() {
        simulator.execute(commandString: "PLACE 1,2,EAST")
        simulator.execute(commandString: "MOVE")
        simulator.execute(commandString: "MOVE")
        simulator.execute(commandString: "LEFT")
        simulator.execute(commandString: "MOVE")
        XCTAssertEqual(simulator.robot.report(), "3,3,NORTH")
    }

    func testRobotDoesNotFallNorth() {
        simulator.execute(commandString: "PLACE 0,4,NORTH")
        simulator.execute(commandString: "MOVE") // This should be ignored
        XCTAssertEqual(simulator.robot.report(), "0,4,NORTH")
    }
    
    func testRobotDoesNotFallEast() {
        simulator.execute(commandString: "PLACE 4,0,EAST")
        simulator.execute(commandString: "MOVE") // This should be ignored
        XCTAssertEqual(simulator.robot.report(), "4,0,EAST")
    }

    func testRobotDoesNotFallSouth() {
        simulator.execute(commandString: "PLACE 0,0,SOUTH")
        simulator.execute(commandString: "MOVE") // This should be ignored
        XCTAssertEqual(simulator.robot.report(), "0,0,SOUTH")
    }

    func testRobotDoesNotFallWest() {
        simulator.execute(commandString: "PLACE 0,0,WEST")
        simulator.execute(commandString: "MOVE") // This should be ignored
        XCTAssertEqual(simulator.robot.report(), "0,0,WEST")
    }
    
    func testInvalidPlaceIsIgnored() {
        simulator.execute(commandString: "PLACE 5,5,NORTH")
        XCTAssertFalse(simulator.robot.isPlaced)
    }

    func testCommandsBeforeValidPlaceAreIgnored() {
        simulator.execute(commandString: "MOVE")
        simulator.execute(commandString: "LEFT")
        simulator.execute(commandString: "REPORT")
        simulator.execute(commandString: "PLACE 0,0,NORTH")
        XCTAssertEqual(simulator.robot.report(), "0,0,NORTH")
    }
}
