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
              const Text("МИ ТРЕБА", style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),),
              const SizedBox(height: 50,),
              Button(
                label: 'ЈАБОЛКО',
                onPressed: () {
                  _playAudio('audio/apple.mp3');
                },
              ),
              const SizedBox(height: 20),
              Button(
                label: 'ВОДА',
                onPressed: () {
                  _playAudio('audio/voda.mp3');
                },
              ),
              const SizedBox(height: 20),
              Button(
                label: 'КНИГА',
                onPressed: () {
                  _playAudio('audio/kniga.mp3');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
