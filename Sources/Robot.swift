//
//  Robot.swift
//  MyToyRobot
//
//  Created by govardhan singh bhati on 20/08/25.
//

// Defines the Robot itself, its properties, and its core actions.

import Foundation

/// Represents the toy robot and its state.
struct Robot {
    // The robot's state is optional because it is not considered "on the table"
    // until a valid PLACE command has been issued.
    private(set) var position: Position?
    private(set) var direction: Direction?

    /// A computed property to check if the robot has been placed on the table.
    var isPlaced: Bool {
        return position != nil && direction != nil
    }

    /// Places the robot at a specific position and direction.
    /// This is the only way to put the robot on the table.
    mutating func place(at position: Position, facing direction: Direction) {
        self.position = position
        self.direction = direction
    }

    /// Moves the robot one unit forward in its current direction.
    /// This command is ignored if the robot is not on the table.
    mutating func move() {
        guard isPlaced, let currentPosition = position, let currentDirection = direction else { return }
        position = currentPosition.adding(currentDirection.vector)
    }

    /// Rotates the robot 90 degrees to the left.
    /// This command is ignored if the robot is not on the table.
    mutating func turnLeft() {
        guard isPlaced, let currentDirection = direction else { return }
        direction = currentDirection.turnLeft()
    }

    /// Rotates the robot 90 degrees to the right.
    /// This command is ignored if the robot is not on the table.
    mutating func turnRight() {
        guard isPlaced, let currentDirection = direction else { return }
        direction = currentDirection.turnRight()
    }

    /// Generates a string report of the robot's current position and direction.
    /// - Returns: A string like "X,Y,DIRECTION" or nil if the robot is not on the table.
    func report() -> String? {
        guard let position = position, let direction = direction else { return nil }
        return "\(position.x),\(position.y),\(direction.rawValue)"
    }
}
