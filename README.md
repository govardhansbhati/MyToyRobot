
# Toy Robot Simulator (Swift)

A command-line application written in **Swift** that simulates a toy robot moving on a **5x5 square tabletop**.  
The robot can be placed on the table, moved, rotated left/right, and instructed to report its current position.

---

## Project Structure

The project is organized as a **Swift Package**, with an executable target and a test target.

````
.
├── Package.swift
├── Sources
│    ├── Command.swift
│    ├── Direction.swift
│    ├── Position.swift
│    ├── Robot.swift
│    ├── Simulator.swift
│    ├── Table.swift
│    └── main.swift
└── Tests
    └── ToyRobotSimulatorTests
      ├── CommandParserTests.swift
      ├── RobotTests.swift
      ├── SimulatorTests.swift
      └── TableTests.swift


````

##  How to Build and Run

### Requirements
- macOS with **Xcode** installed
- Swift Package Manager (SPM)

### Building the Project
1. Save all source files into the directory structure shown above.
2. Open `Package.swift` in **Xcode**.  
   Xcode will automatically set up the project.
3. Build with:
   - **Cmd + B** or `Product > Build`.

###  Running the Simulator

#### Option 1: From Xcode
1. Select the **ToyRobotSimulator** executable scheme.
2. Run with **Cmd + R** or `Product > Run`.
3. Enter commands in the Xcode console.

Example:

PLACE 0,0,NORTH
MOVE
REPORT


#### Option 2: From Terminal
1. Build the project in Xcode or using SPM.
2. Open **Terminal** and navigate to the project root.
3. Run:
   ```bash
   swift run
4. Enter commands interactively.
5. Exit with **Ctrl + D**.

---

##  Running Tests

The project includes a full suite of **unit tests** with `XCTest`.

* Open the project in Xcode.
* Run tests with **Cmd + U** or `Product > Test`.
* Results will appear in the **Test Navigator**. ✅ = passed

---

## 📝 Test Data Examples

### Example A: Simple Move

**Input:**

```
PLACE 0,0,NORTH
MOVE
REPORT
```

**Expected Output:**

```
0,1,NORTH
```

---

### Example B: Simple Turn

**Input:**

```
PLACE 0,0,NORTH
LEFT
REPORT
```

**Expected Output:**

```
0,0,WEST
```

---

### Example C: Complex Movement

**Input:**

```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```

**Expected Output:**

```
3,3,NORTH
```

---

### Example D: Ignoring Commands Before Placement

**Input:**

```
MOVE
LEFT
REPORT
PLACE 1,1,SOUTH
REPORT
```

**Expected Output:**

```
1,1,SOUTH
```

---

### Example E: Preventing Falls

**Input:**

```
PLACE 0,0,WEST
MOVE
MOVE
RIGHT
PLACE 4,4,NORTH
MOVE
LEFT
MOVE
REPORT
```

**Expected Output:**

```
// The first MOVE is ignored as it would cause a fall.
// The second MOVE is also ignored.
// The second PLACE command is valid.
// The MOVE after that is ignored.
// The turn is valid.
// The final move is valid.
3,4,WEST
```

---

### Example F: Invalid PLACE Command

**Input:**

```
PLACE 6,6,NORTH
REPORT
PLACE 0,0,EAST
REPORT
```

**Expected Output:**

```
// The first PLACE is invalid and ignored.
// The first REPORT is ignored as the robot is not on the table.
// The second PLACE is valid.
0,0,EAST
```

---
