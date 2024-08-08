class Food {
  final String title;
  final String image;
  final String audio;

  Food({
    required this.title,
    required this.image,
    required this.audio,
  });
}

List<Food> foods = [
  Food(
      title: 'ЈАБОЛКО',
      image: 'assets/food/apple.png',
      audio: 'audio/apple.mp3'
    ),
  Food(
      title: 'БАНАНА',
      image: 'assets/food/banana.png',
      audio: 'audio/banana.mp3'
    ),
      Food(
      title: 'МОРКОВ',
      image: 'assets/food/carrot.png',
      audio: 'audio/carrot.mp3'
    ),
      Food(
      title: 'ПОРТОКАЛ',
      image: 'assets/food/orange.png',
      audio: 'audio/orange.mp3'
    ),
      Food(
      title: 'КРУША',
      image: 'assets/food/pear.png',
      audio: 'audio/pear.mp3'
    ),
      Food(
      title: 'ЛУБЕНИЦА',
      image: 'assets/food/watermelon.png',
      audio: 'audio/watermelon.mp3'
    )


];
