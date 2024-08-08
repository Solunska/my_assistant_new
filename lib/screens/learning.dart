import 'package:flutter/material.dart';
import 'package:my_assistant/UI/gradient_background.dart';
import 'package:my_assistant/classes/number.dart';
import 'package:my_assistant/classes/food.dart';
import 'package:my_assistant/classes/greetings.dart';
import 'package:my_assistant/classes/shape.dart';
import 'package:audioplayers/audioplayers.dart';

class Learning extends StatefulWidget {
  final String category;

  const Learning({super.key, required this.category});

  @override
  LearningState createState() => LearningState();
}

class LearningState extends State<Learning> {
 // final player = AudioPlayer();
  int currentIndex = 0;

  // Future<void> playAudio(String url) async {
  //   await player.play(UrlSource(url));
  // }

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }

  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(String audioFile) {
    _audioPlayer.play(AssetSource(audioFile));
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> categoryItems = [];
    String label = '';
    if (widget.category == 'numbers') {
      categoryItems = numbers;
      label = 'БРОЕВИ';
    } else if (widget.category == 'shapes') {
      categoryItems = shapes;
      label = 'ФОРМИ';
    } else if (widget.category == 'greetings') {
      categoryItems = greetings;
      label = 'ПОЗДРАВИ';
    } else if (widget.category == 'foods') {
      categoryItems = foods;
      label = 'ХРАНА';
    }

    void nextItem() {
      setState(() {
        if (currentIndex < categoryItems.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }
      });
    }

    void previousItem() {
      setState(() {
        if (currentIndex > 0) {
          currentIndex--;
        } else {
          currentIndex = categoryItems.length - 1;
        }
      });
    }

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
            label,
            style: const TextStyle(
              fontSize: 43,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFFF0F6F6),
          iconTheme: const IconThemeData(
            color:  Color.fromARGB(255, 6, 26, 42),
          ),
          titleTextStyle: const TextStyle(
            color:  Color.fromARGB(255, 6, 26, 42),
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              categoryItems[currentIndex].image,
              width: 800,
              height: 400,
            ),
            Text(
              categoryItems[currentIndex].title,
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(7),
                      backgroundColor: Colors.white),
                  onPressed: previousItem,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 35,
                      color: Color(0xFF084B83),
                    ),
                    onPressed: previousItem,
                  ),
                ),
                const SizedBox(width: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: const Color(0xFFFF66B3),
                  ),
                  onPressed: () {
                     _playAudio(categoryItems[currentIndex].audio);
                  },
                  child: const Icon(
                    Icons.volume_up,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(7),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: nextItem,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 35,
                      color: Color(0xFF084B83),
                    ),
                    onPressed: nextItem,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
