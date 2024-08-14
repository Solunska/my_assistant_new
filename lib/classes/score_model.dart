class ScoreModel {
  int bestScore;
  int worstScore;
  int correctAnswers;

  ScoreModel({
    required this.bestScore,
    required this.worstScore,
    required this.correctAnswers,
  });

  void updateBestScore(int newScore) {
    if (newScore > bestScore) {
      bestScore = newScore;
    }
  }

  void updateWorstScore(int newScore) {
    if (newScore < worstScore || worstScore == 0) {
      worstScore = newScore;
    }
  }

  void incrementCorrectAnswers() {
    correctAnswers++;
  }
}
