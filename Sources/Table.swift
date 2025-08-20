//
//  Table.swift
//  MyToyRobot
//
//  Created by govardhan singh bhati on 20/08/25.
//

// Defines the tabletop surface and its boundaries.

import Foundation

/// Represents the square tabletop.
struct Table {
    let width: Int
    let height: Int

    /// Checks if a given position is within the boundaries of the table.
    /// The origin (0,0) is the SOUTH WEST corner.
    /// - Parameter position: The position to validate.
    /// - Returns: `true` if the position is on the table, otherwise `false`.
    func isValid(position: Position) -> Bool {
        return position.x >= 0 && position.x < width &&
               position.y >= 0 && position.y < height
    }
}
