import Algorithms
import Foundation

struct Day02: AdventDay {
  var data: String

  var reports: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }

  func isReportSafe(_ numbers: [Int]) -> Bool {
    // Need at least 2 numbers to compare
    guard numbers.count > 1 else { return true }

    // Get the first difference to determine if we should be increasing or decreasing
    let firstDiff = numbers[1] - numbers[0]

    // If first difference is 0 or outside allowed range, report is unsafe
    if firstDiff == 0 || abs(firstDiff) > 3 {
      return false
    }

    // Check if we're expecting increasing or decreasing pattern
    let isIncreasing = firstDiff > 0

    // Check each adjacent pair
    for i in 1..<numbers.count {
      let diff = numbers[i] - numbers[i - 1]

      // Check if difference matches our pattern and is within bounds
      if isIncreasing {
        if diff <= 0 || diff > 3 {
          return false
        }
      } else {
        if diff >= 0 || diff < -3 {
          return false
        }
      }
    }

    return true
  }

  func part1() -> Any {
    let safeReports = reports.filter(isReportSafe).count
    return safeReports
  }

  func isReportSafeWithDampener(_ numbers: [Int]) -> Bool {
    // If it's already safe without dampener, return true
    if isReportSafe(numbers) {
      return true
    }

    // Try removing each number one at a time and check if it becomes safe
    for i in 0..<numbers.count {
      var modifiedNumbers = numbers
      modifiedNumbers.remove(at: i)

      if isReportSafe(modifiedNumbers) {
        return true
      }
    }

    return false
  }

  func part2() -> Any {
    let safeReports = reports.filter(isReportSafeWithDampener).count
    return safeReports
  }
}
