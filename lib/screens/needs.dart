import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:my_assistant/UI/button.dart';
import 'package:my_assistant/UI/gradient_background.dart';

class NeedsScreen extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final String category;

  NeedsScreen({super.key, required this.category});

  void _playAudio(String audioFile) {
    _audioPlayer.play(AssetSource(audioFile));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          _getAppBarTitle(),
          style: const TextStyle(
            fontSize: 24,
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
      body: GradientBackground(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight, // Ensures content fills available space
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildCategoryContent(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _getAppBarTitle() {
    switch (category) {
      case 'needs':
        return 'МИ ТРЕБА';
      case 'want':
        return 'САКАМ';
      case 'feel':
        return 'СЕ ЧУВСТУВАВAM';
      case 'dislike':
        return 'НЕ МИ СЕ ДОПАЃА';
      default:
        return '';
    }
  }

  List<Widget> _buildCategoryContent() {
    switch (category) {
      case 'needs':
        return [
          _buildItem('ХРАНА', 'assets/needs/hrana.png', 'audio/hrana.mp3'),
          _buildItem('ВОДА', 'assets/needs/voda.png', 'audio/voda.mp3'),
          _buildItem('ПОМОШ', 'assets/needs/pomos.png', 'audio/pomos.mp3'),
        ];

      case 'feel':
        return [
          _buildItem('СРЕЌНО', 'assets/needs/srekno.png', 'audio/srekno.mp3'),
          _buildItem('ИЗМОРЕНО', 'assets/needs/izmoreno.png', 'audio/izmoreno.mp3'),
          _buildItem('ТАЖНО', 'assets/needs/tazno.png', 'audio/tazno.mp3'),
        ];
      case 'dislike':
        return [
          _buildItem('ХРАНАВА', 'assets/needs/hrana.png', 'audio/hrana.mp3'),
          _buildItem('МЕСТОВО', 'assets/needs/mesto.png', 'audio/mesto.mp3'),
          _buildItem('МУЗИКАВА', 'assets/needs/muzika.png', 'audio/muzika.mp3'),
        ];
      default:
        return [];
    }
  }

  Widget _buildItem(String label, String image, String audio) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity, // Ensures the item takes full width available
        child: Column(
          children: [
            Image.asset(
              image,
              height: 60,
              fit: BoxFit.cover, // Ensure image scales properly
            ),
            const SizedBox(height: 10),
            Button(
              label: label,
              onPressed: () {
                _playAudio(audio);
              },
            ),
          ],
        ),
      ),
    );
  }
}
