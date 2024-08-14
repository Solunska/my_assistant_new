import 'package:flutter/foundation.dart';
import 'score_model.dart';

class ScoreProvider extends ChangeNotifier {
  // A map to hold the scores for each category
  final Map<String, ScoreModel> _scores = {};

  // Method to get the score for a specific category
  ScoreModel getScore(String category) {
    if (!_scores.containsKey(category)) {
      _scores[category] = ScoreModel(bestScore: 0, worstScore: 0, correctAnswers: 0);
    }
    return _scores[category]!;
  }

  // Method to update the score when a question is answered
  void updateScore(String category, int newScore, bool isCorrect) {
    final score = getScore(category);

    if (isCorrect) {
      score.incrementCorrectAnswers();
      score.updateBestScore(newScore);
    } else {
      score.updateWorstScore(newScore);
    }

    notifyListeners();
  }
}
