//
//  Position.swift
//  MyToyRobot
//
//  Created by govardhan singh bhati on 20/08/25.
//

// A simple structure to represent X,Y coordinates.

import Foundation

/// Represents a coordinate on the table.
struct Position: Equatable {
    var x: Int
    var y: Int

    /// Creates a new position by adding a vector (another position) to the current one.
    /// This is used for calculating the next position during a MOVE command.
    /// - Parameter vector: The vector to add (e.g., (0, 1) for NORTH).
    /// - Returns: A new `Position` instance.
    func adding(_ vector: Position) -> Position {
        return Position(x: self.x + vector.x, y: self.y + vector.y)
    }
}
