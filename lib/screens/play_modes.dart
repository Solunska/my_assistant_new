import 'package:flutter/material.dart';
import 'package:my_assistant/UI/gradient_background.dart';
import 'package:my_assistant/screens/categories.dart';

class PlayingModesScreen extends StatelessWidget {
  const PlayingModesScreen({super.key});

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
          title: const Text(
            'ИГРАМЕ',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFFf0F0F6),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 130), // Set width and height here
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0), // Adjust padding here
                  textStyle: const TextStyle(
                    fontSize: 20, // Text size
                  ),
                  backgroundColor: const Color(0xFF084B83),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriesScreen(
                        appBarLabel: 'ПОВРЗИ ГИ',
                        appBarFontSize: 43,
                        gameMode: 'connect',
                      ),
                    ),
                  );
                },
                child: const Text(
                  'ПОВРЗИ ГИ',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 130), // Set width and height here
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0), // Adjust padding here
                  textStyle: const TextStyle(
                    fontSize: 10, // Text size
                  ),
                  backgroundColor:  const Color(0xFF084B83),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriesScreen(
                        appBarLabel: 'ПОГОДИ ГО ТОЧНИОТ\nОДГОВОР',
                        appBarFontSize: 28,
                        gameMode: 'questions',
                      ),
                    ),
                  );
                },
                child: const Text(
                  'ПОГОДИ ГО\nТОЧНИОТ ОДГОВОР',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
