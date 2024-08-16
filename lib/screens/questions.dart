import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:my_assistant/UI/gradient_background.dart';
import 'package:my_assistant/classes/number.dart';
import 'package:my_assistant/classes/food.dart';
import 'package:my_assistant/classes/greetings.dart';
import 'package:my_assistant/classes/score_provider.dart';
import 'package:my_assistant/classes/shape.dart';
import 'package:my_assistant/screens/progress.dart';
import 'package:provider/provider.dart';

class Questions extends StatefulWidget {
  final String label;
  final String category;
  const Questions({super.key, required this.label, required this.category});

  @override
  QuestionsState createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {
  List<dynamic> items = [];
  List<String> answers = [];
  List<String> disabledAnswers = [];
  dynamic currentItem;
  String message = '';
  int currentQuestionIndex = 0;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));

    if (widget.category == 'numbers') {
      items = List<dynamic>.from(numbers);
    } else if (widget.category == 'shapes') {
      items = List<dynamic>.from(shapes);
    } else if (widget.category == 'greetings') {
      items = List<dynamic>.from(greetings);
    } else if (widget.category == 'foods') {
      items = List<dynamic>.from(foods);
    }

    items.shuffle(); // Randomize the order of items
    setupQuestion();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void setupQuestion() {
    if (currentQuestionIndex < items.length) {
      currentItem = items[currentQuestionIndex];

      // Ensure the correct answer is always included, then fill the rest randomly
      List<String> otherOptions = items
          .where((item) => item.title != currentItem.title)
          .map<String>((item) => item.title as String)
          .toList();
      otherOptions.shuffle();

      answers = [currentItem.title, ...otherOptions.take(2)];
      answers.shuffle();

      disabledAnswers.clear();
    } else {
      // Show completion message on the same screen
      setState(() {
        message = 'Честитки другарче! Ги одговори сите прашања!';
      });
    }
  }

  void checkAnswer(String answer) {
    setState(() {
      if (answer == currentItem.title) {
        _confettiController.play();

        // Update the score for the correct answer
        Provider.of<ScoreProvider>(context, listen: false)
            .updateScore(widget.category, 5, true); // Adjust score value as needed

        currentQuestionIndex++;

        // Prepare the next question first
        setupQuestion();
      } else {
        message = 'ГРЕШНО, ОБИДИ СЕ ПОВТОРНО!';

        // Update the score for the incorrect answer
        Provider.of<ScoreProvider>(context, listen: false)
            .updateScore(widget.category, 2, false); // Adjust score value as needed

        disabledAnswers.add(answer); // Add incorrect answer to disabled list
      }
    });
  }

  void navigateToCategoriesScreen() {
    Navigator.of(context).pop(); // Navigate back to the categories screen
  }
    void navigateToProgressScreen() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ProgressScreen(),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 45,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFFF0F0F6),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 6, 26, 42),
          ),
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 6, 26, 42),
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: GradientBackground(
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (currentQuestionIndex < items.length) ...[
                      for (var answer in answers)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: SizedBox(
                            width: 250,
                            height: 75,
                            child: ElevatedButton(
                              onPressed: disabledAnswers.contains(answer)
                                  ? null
                                  : () => checkAnswer(answer),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Text color
                                ),
                                backgroundColor: disabledAnswers.contains(answer)
                                    ? Colors.red
                                    : Colors.white,
                                // Background color
                              ),
                              child: Text(
                                answer,
                                style: const TextStyle(
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 60),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(currentItem.image),
                      ),
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ] else ...[
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green, // Green color for the congratulatory message
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: navigateToCategoriesScreen,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // More noticeable button color
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 20,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('Да играме нешто друго!'),
                      ),
                      const SizedBox(height: 30),
                       ElevatedButton(
                        onPressed: navigateToProgressScreen,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // More noticeable button color
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 20,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('Следи го напредокот!'),
                      ),
                    ],
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: false,
                  colors: const [
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                    Colors.orange,
                    Colors.purple
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
