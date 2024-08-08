class Greeting {
  final String title;
  final String image;
  final String audio;

  Greeting({
    required this.title,
    required this.image,
    required this.audio,
  });
}

List<Greeting> greetings = [
  Greeting(
    title: 'ДОБРО УТРО',
    image: 'assets/greetings-images/good-morning.png',
    audio: 'audio/good-morning.mp3',
  ),
  Greeting(
    title: 'ДОБРА НОЌ',
    image: 'assets/greetings-images/good-night.png',
    audio: 'audio/good-night.mp3',
  ),
  Greeting(
    title: 'ЗДРАВО',
    image: 'assets/greetings-images/hello.png',
    audio: 'audio/hello.mp3',
  ),
  Greeting(
    title: 'ПРИЈАТНО',
    image: 'assets/greetings-images/goodbye.png',
    audio: 'audio/bye.mp3',
  ),
];
