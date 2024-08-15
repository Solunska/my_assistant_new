class Shape {
  final String title;
  final String image;
  final String audio;

  Shape({
    required this.title,
    required this.image,
    required this.audio,
  });
}

List<Shape> shapes = [
  Shape(
      title: 'КРУГ',
      image: 'assets/shapes/circle.png',
      audio: 'audio/circle.mp3'),
  Shape(
      title: 'ТРИАГОЛНИК',
      image: 'assets/shapes/triangle.png',
      audio: 'audio/triangle.mp3'),
  Shape(
      title: 'КВАДРАТ',
      image: 'assets/shapes/square.png',
      audio: 'audio/square.mp3'),
      Shape(
      title: 'ПРАВОАГОЛНИК',
      image: 'assets/shapes/rectangle.png',
      audio: 'audio/rectangle.mp3'),
  Shape(
      title: 'ДИЈАМАНТ',
      image: 'assets/shapes/diamond.png',
      audio: 'audio/rectangle.mp3'),
      Shape(
      title: 'ЕЛИПСА',
      image: 'assets/shapes/elipse.png',
      audio: 'audio/rectangle.mp3'),
      Shape(
      title: 'СРЦЕ',
      image: 'assets/shapes/heart.png',
      audio: 'audio/rectangle.mp3'),
      Shape(
      title: 'ЗВЕЗДА',
      image: 'assets/shapes/star.png',
      audio: 'audio/rectangle.mp3'),
];
