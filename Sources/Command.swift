//
//  Command.swift
//  MyToyRobot
//
//  Created by govardhan singh bhati on 20/08/25.
//

// An enumeration that represents the valid commands and a parser to create them from strings.

import Foundation

/// Represents a valid, parsed command that the simulator can execute.
enum Command {
    case place(position: Position, direction: Direction)
    case move
    case left
    case right
    case report

    /// Parses a raw string into a `Command` enum case.
    /// - Parameter input: The string to parse (e.g., "PLACE 1,2,EAST").
    /// - Returns: A `Command` instance or `nil` if parsing fails.
    static func parse(from input: String) -> Command? {
        let components = input.split(separator: " ", maxSplits: 1).map { String($0) }
        let commandName = components.first?.uppercased()

        switch commandName {
        case "PLACE":
            guard components.count == 2 else { return nil }
            let args = components[1].split(separator: ",").map { String($0) }
            guard args.count == 3,
                  let x = Int(args[0]),
                  let y = Int(args[1]),
                  let direction = Direction(rawValue: args[2].uppercased()) else {
                return nil
            }
            return .place(position: Position(x: x, y: y), direction: direction)

        case "MOVE":
            return .move
        case "LEFT":
            return .left
        case "RIGHT":
            return .right
        case "REPORT":
            return .report
        default:
            return nil // Invalid command name
        }
    }
}
