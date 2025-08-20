//
//  Simulator.swift
//  MyToyRobot
//
//  Created by govardhan singh bhati on 20/08/25.
//

// This class is the main orchestrator of the simulation.
// It holds the robot and table, parses input, and executes commands.

import Foundation

/// Manages the overall simulation, including the robot and the table.
class Simulator {
    let table = Table(width: 5, height: 5)
    var robot = Robot()

    /// Executes a command string by parsing it and applying it to the robot.
    /// - Parameter commandString: The raw input string from the user.
    func execute(commandString: String) {
        // Attempt to parse the string into a Command enum case.
        guard let command = Command.parse(from: commandString) else {
            // Silently ignore invalid or malformed commands.
            return
        }

        // Execute the parsed command.
        switch command {
        case .place(let position, let direction):
            // Only place the robot if the position is valid for the table.
            if table.isValid(position: position) {
                robot.place(at: position, facing: direction)
            }
        case .move:
            // Calculate the potential next position.
            guard let nextPosition = robot.position?.adding(robot.direction?.vector ?? Position(x: 0, y: 0)) else { return  }
            // Only move the robot if the next position is valid.
            if table.isValid(position: nextPosition) {
                robot.move()
            }
        case .left:
            robot.turnLeft()
        case .right:
            robot.turnRight()
        case .report:
            // The report function will only print if the robot has been placed.
            if let report = robot.report() {
                print(report)
            }
        }
    }
}
