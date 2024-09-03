import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:my_assistant/UI/button.dart';
import 'package:my_assistant/UI/gradient_background.dart';

class NeedsScreen extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(String audioFile) {
    _audioPlayer.play(AssetSource(audioFile));
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
              color: Color(0xFF084B83),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            "КОМУНИКАЦИЈА",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF084B83),
            ),
          ),
          backgroundColor: const Color(0xFFF0F6F6),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "МИ ТРЕБА",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/needs/hrana.png',
                        height: 60,
                      ),
                      const SizedBox(height: 10),
                      Button(
                        label: 'ХРАНА',
                        onPressed: () {
                          _playAudio('audio/hrana.mp3');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/needs/voda.png',
                        height: 60,
                      ),
                      const SizedBox(height: 10),
                      Button(
                        label: 'ВОДА',
                        onPressed: () {
                          _playAudio('audio/voda.mp3');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/needs/pomos.png',
                        height: 60,
                      ),
                      const SizedBox(height: 10),
                      Button(
                        label: 'ПОМОШ',
                        onPressed: () {
                          _playAudio('audio/pomos.mp3');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
