import Foundation
import Algorithms

struct Day01: AdventDay {
  var data: String
  
  var entities: ([Int], [Int]) {
    let lines = data.split(separator: "\n")
    var leftList: [Int] = []
    var rightList: [Int] = []
    
    for line in lines {
      let numbers = line.trimmingCharacters(in: .whitespaces)
        .components(separatedBy: CharacterSet.whitespaces)
        .filter { !$0.isEmpty }
        .compactMap { Int($0) }
      
      if numbers.count == 2 {
        leftList.append(numbers[0])
        rightList.append(numbers[1])
      }
    }
    
    return (leftList, rightList)
  }
  
  func part1() -> Any {
    let (left, right) = entities
    var sortedLeft = left
    var sortedRight = right
    
    sortedLeft.sort()
    sortedRight.sort()
    
    return zip(sortedLeft, sortedRight)
      .map { abs($0 - $1) }
      .reduce(0, +)
  }
  
  func part2() -> Any {
    let (left, right) = entities
    
    // 1. Create a frequency dictionary for the right list
    let rightFrequency = right.reduce(into: [:]) { counts, number in
      counts[number, default: 0] += 1
    }
    
    // 2. Process each number in left list and calculate similarity score
    let similarityScore = left.reduce(0) { score, number in
      // Get count from frequency dictionary (0 if number doesn't exist)
      let occurrences = rightFrequency[number] ?? 0
      // Add to score: number * how many times it appears in right list
      return score + (number * occurrences)
    }
    
    return similarityScore
  }
}
