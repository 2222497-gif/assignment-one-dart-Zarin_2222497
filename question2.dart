// Question 2: Collections & Control Flow (Difficulty: 2/5) ⭐⭐
/**
 * EXPECTED OUTPUT:
 * Student Scores: {Alice: <random>, Bob: <random>, ...}
 * Highest Score: <Name> with <Score>
 * Lowest Score: <Name> with <Score>
 * Average Score: <Value>
 * Alice: <Score> (Category)
 * ...
 */

import 'dart:math';

void main() {
  // 1. Create a List<String> of student names
  List<String> studentNames = ["Alice", "Bob", "Charlie", "Diana", "Eve"];

  // 2. Create a Map<String, int> to store student scores
  Map<String, int> studentScores = {};

  // 3. Assign random scores (60-100) to each student
  Random random = Random();
  for (String name in studentNames) {
    studentScores[name] = 60 + random.nextInt(41);
  }

  print("Student Scores: $studentScores");
}
