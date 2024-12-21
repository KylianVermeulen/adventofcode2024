import Algorithms
import Foundation

struct Position {
  let x: Int
  let y: Int
}

enum Direction {
  case up, down, left, right
  case activate
}

enum Keypad {
  case numeric    // The door keypad (789,456,123,0A)
  case directional // The control keypad (^A, <v>)
}

// Represents a robot's current state
struct RobotState {
  var position: Position  // Current position
  var keypad: Keypad     // Which keypad this robot is operating on
}

// a. Keypad layouts
let numericKeypad = [
  ["7", "8", "9"],
  ["4", "5", "6"],
  ["1", "2", "3"],
  [" ", "0", "A"]
]

let directionalKeypad = [
  [" ", "^", "A"],
  ["<", "v", ">"]
]

// b. State tracking for multiple robots:
struct ChainedRobots {
  var userRobot: RobotState    // Your controls
  var firstMiddleRobot: RobotState  // Second robot
  var secondMiddleRobot: RobotState  // Third robot
  var doorRobot: RobotState    // Robot at numeric keypad
}

struct Day21: AdventDay {
  var data: String
  
  // 1. Parse input codes
  var codes: [String] {
    data.split(separator: "\n", omittingEmptySubsequences: true).map(String.init)
  }
  
  func part1() throws -> Never {
    // 1. For each code:
    //    - Find shortest sequence using BFS/DFS
    //    - Calculate complexity
    //    - Add to running sum
    
    // 2. Return final sum
    // return calculateComplexity(codes: codes)
    
    throw PartUnimplemented(day: day, part: 1)
  }
  
  // Main solver function
  func calculateComplexity(codes: [String]) -> Int {
    // TODO: For each code:
    // 1. Find shortest button sequence
    // 2. Calculate complexity (sequence_length * numeric_value)
    // 3. Sum all complexities
    
    var chainedRobots = ChainedRobots(
      userRobot: .init(position: .init(x: 2, y: 0), keypad: .directional),
      firstMiddleRobot: .init(position: .init(x: 2, y: 0), keypad: .directional),
      secondMiddleRobot: .init(position: .init(x: 2, y: 0), keypad: .directional),
      doorRobot: .init(position: .init(x: 2, y: 3), keypad: .numeric)
    )
    
    return 0
  }
  
  // Given a target code (e.g. "029A"), find shortest sequence of button presses
  func findShortestSequence(targetCode: String) -> String {
    // TODO: Implement BFS/DFS to find shortest valid sequence
    // Need to handle all three levels of robots
    return ""
  }
  
  // Helper function to validate moves
  func isValidMove(from: Position, direction: Direction, on keypad: Keypad) -> Bool {
    // TODO: Check if move would result in robot panic (hitting empty space)
    return false
  }
  
  // Helper to execute a move
  func executeMove(state: RobotState, direction: Direction) -> RobotState {
    // TODO: Return new state after executing move
    var state = state
    
    switch direction {
    case .up: state.position = .init(x: state.position.x, y: state.position.y - 1)
    case .down: state.position = .init(x: state.position.x, y: state.position.y + 1)
    case .left: state.position = .init(x: state.position.x - 1, y: state.position.y)
    case .right: state.position = .init(x: state.position.x + 1, y: state.position.y)
    case .activate: break
    }
    
    return state
  }
  
  // Helper to execute a move
  func executeMove(state: ChainedRobots, direction: Direction) -> ChainedRobots {
    var state = state
    
    switch direction {
    case .up, .down, .left, .right: state.userRobot = executeMove(state: state.firstMiddleRobot, direction: direction)
    case .activate: break
    }
    
    return state
  }
}

/**
 Were you to choose this sequence of button presses, here are all of the buttons that would be pressed on your directional keypad, the two robots' directional keypads, and the numeric keypad:
 ``<vA<AA>>^AvAA<^A>A<v<A>>^AvA^A<vA>^A<v<A>^A>AAvA^A<v<A>A>^AAAvA<^A>A
 ``v<<A>>^A<A>AvA<^AA>A<vAAA>^A
 ``<A^A>^^AvvvA
 ``029A
 
 In summary, there are the following keypads:
 - One directional keypad that you are using.
 - Two directional keypads that robots are using.
 - One numeric keypad (on a door) that a robot is using.
 */
