class Number {
  final String title;
  final String image;
  final String audio;
  final String numbersImage;

  Number({
    required this.title,
    required this.image,
    required this.audio,
    required this.numbersImage
  });
}

List<Number> numbers = [
  Number(
      title: 'ЕДЕН',
      image: 'assets/numbers/1.png',
      audio: 'audio/one.mp3',
      numbersImage: 'assets/numbers/one.png'),
  Number(
      title: 'ДВА',
      image: 'assets/numbers/2.png',
      audio: 'audio/two.mp3',
      numbersImage: 'assets/numbers/two.png'),
  Number(
      title: 'ТРИ',
      image: 'assets/numbers/3.png',
      audio: 'audio/three.mp3',
      numbersImage: 'assets/numbers/three.png'),
  Number(
      title: 'ЧЕТИРИ',
      image: 'assets/numbers/4.png',
      audio: 'audio/four.mp3',
      numbersImage: 'assets/numbers/four.png'),
  Number(
      title: 'ПЕТ',
      image: 'assets/numbers/5.png',
      audio: 'audio/give.mp3',
      numbersImage: 'assets/numbers/five.png'),
  Number(
      title: 'ШЕСТ',
      image: 'assets/numbers/6.png',
      audio: 'audio/six.mp3',
      numbersImage: 'assets/numbers/six.png'),
  Number(
      title: 'СЕДУМ',
      image: 'assets/numbers/7.png',
      audio: 'audio/seven.mp3',
      numbersImage: 'assets/numbers/seven.png'),
  Number(
      title: 'ОСУМ',
      image: 'assets/numbers/8.png',
      audio: 'audio/eight.mp3',
      numbersImage: 'assets/numbers/eight.png'),
  Number(
      title: 'ДЕВЕТ',
      image: 'assets/numbers/9.png',
      audio: 'audio/nine.mp3',
      numbersImage: 'assets/numbers/nine.png'),
  Number(
      title: 'ДЕСЕТ',
      image: 'assets/numbers/10.png',
      audio: 'audio/ten.mp3',
      numbersImage: 'assets/numbers/ten.png'),
];
