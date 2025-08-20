//
//  Direction.swift
//  MyToyRobot
//
//  Created by govardhan singh bhati on 20/08/25.
//

// An enumeration for the four cardinal directions and their behaviors.

import Foundation

/// Represents the cardinal directions the robot can face.
enum Direction: String, CaseIterable {
    case NORTH
    case EAST
    case SOUTH
    case WEST

    /// Provides the change in X and Y for a MOVE command in this direction.
    var vector: Position {
        switch self {
        case .NORTH: return Position(x: 0, y: 1)
        case .EAST:  return Position(x: 1, y: 0)
        case .SOUTH: return Position(x: 0, y: -1)
        case .WEST:  return Position(x: -1, y: 0)
        }
    }

    /// Returns the new direction after turning left.
    func turnLeft() -> Direction {
        switch self {
        case .NORTH: return .WEST
        case .EAST:  return .NORTH
        case .SOUTH: return .EAST
        case .WEST:  return .SOUTH
        }
    }

    /// Returns the new direction after turning right.
    func turnRight() -> Direction {
        switch self {
        case .NORTH: return .EAST
        case .EAST:  return .SOUTH
        case .SOUTH: return .WEST
        case .WEST:  return .NORTH
        }
    }
}
