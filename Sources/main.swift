import Foundation

// Create the simulator instance which orchestrates the application.
let simulator = Simulator()

print("Toy Robot Simulator")
print("Enter commands (or press Ctrl+D to exit):")

// Read from standard input line by line until the stream is closed (Ctrl+D).
while let line = readLine() {
    // Pass each command to the simulator for processing.
    // The simulator will print output for the REPORT command.
    simulator.execute(commandString: line)
}

print("\nExiting simulator.")
