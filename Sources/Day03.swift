import Algorithms
import Foundation

struct Day03: AdventDay {
  var data: String
  
  func part1() throws -> Never {
    throw PartUnimplemented(day: day, part: 1)
  }
  
  func processAllLines(_ input: String) -> Int {
    // TODO: Split string into lines
    let lines = data.split(separator: "\n")
    // TODO: Process each line and sum results
    let total = lines.map(processLine).reduce(0, +)
    return total
  }
  
  func processLine(_ line: String.SubSequence) -> Int {
    var total = 0
    // TODO: Find all valid mul() instructions in line
    // TODO: For each valid instruction:
    //   - Extract numbers
    //   - Multiply them
    //   - Add to total
    return total
  }
  
  
  func findNextValidInstruction(in text: String, startingAt index: String.Index) -> (instruction: String, endIndex: String.Index)? {
    // TODO: Look for "mul(" pattern
    // TODO: If found, validate the full instruction
    // TODO: Return the full instruction and where it ends if valid
    // TODO: Return nil if no valid instruction found
    return nil
  }
  
  func extractNumbers(from instruction: String) -> (first: Int, second: Int)? {
    // TODO: Extract the two numbers between mul( and )
    // TODO: Validate they are 1-3 digits
    // TODO: Return tuple of numbers if valid
    // TODO: Return nil if invalid
    return nil
  }
}

// Test cases to implement:
// TODO: Test example case from problem
// TODO: Test invalid patterns:
//   - mul(4*
//   - mul(6,9!
//   - ?(12,34)
//   - mul ( 2 , 4 )
// TODO: Test edge cases:
//   - Empty string
//   - Single digit numbers
//   - Three digit numbers
//   - Numbers at limits (1, 999)
//   - Multiple instructions on one line
//   - Nested patterns
