import 'package:flutter/material.dart';
import 'package:my_assistant/UI/gradient_background.dart';
import 'package:my_assistant/classes/number.dart';
import 'package:my_assistant/classes/food.dart';
import 'package:my_assistant/classes/greetings.dart';
import 'package:my_assistant/classes/shape.dart';

class Connect extends StatefulWidget {
  final String label;
  final String category;
  const Connect({super.key, required this.label, required this.category});

  @override
  ConnectState createState() => ConnectState();
}

class ConnectState extends State<Connect> {
  List<dynamic> shuffledImages = [];
  List<dynamic> shuffledTitles = [];
  List<int> selectedImagesIndex = [];
  List<int> selectedTitlesIndex = [];
  bool allMatched = false;

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    List<dynamic> items = [];
    if (widget.category == 'numbers') {
      items = List<dynamic>.from(numbers);
    } else if (widget.category == 'shapes') {
      items = List<dynamic>.from(shapes);
    } else if (widget.category == 'greetings') {
      items = List<dynamic>.from(greetings);
    } else if (widget.category == 'foods') {
      items = List<dynamic>.from(foods);
    }

    setState(() {
      shuffledImages = List.from(items)..shuffle();
      shuffledTitles = List.from(items)..shuffle();
      selectedImagesIndex.clear();
      selectedTitlesIndex.clear();
      allMatched = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
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
        body: allMatched
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'БРАВО!',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: initializeGame,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFFF66B3), // background color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text(
                        'ИГРАЈ ПОВТОРНО',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Row(
                  children: [
                    // Left column with images
                    Expanded(
                      child: Column(
                        children: List.generate(shuffledImages.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedImagesIndex.contains(index)) {
                                  selectedImagesIndex.remove(index);
                                } else {
                                  if (selectedImagesIndex.length < 2) {
                                    selectedImagesIndex.add(index);
                                  }
                                }
                                checkConnections();
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 200,
                              alignment: Alignment.center,
                              color: selectedImagesIndex.contains(index)
                                  ? Colors.blue.withOpacity(0.5)
                                  : Colors.transparent,
                              child: ListTile(
                                leading: SizedBox(
                                  width: 150,
                                  height: 120,
                                  child: Center(
                                    // Center the image vertically
                                    child: Image.asset(
                                      getImage(shuffledImages[index]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    // Right column with titles
                    Expanded(
                      child: Column(
                        children: List.generate(shuffledTitles.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedTitlesIndex.contains(index)) {
                                  selectedTitlesIndex.remove(index);
                                } else {
                                  if (selectedTitlesIndex.length < 2) {
                                    selectedTitlesIndex.add(index);
                                  }
                                }
                                checkConnections();
                              });
                            },
                            child: Container(
                              height: 100,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              color: selectedTitlesIndex.contains(index)
                                  ? Colors.blue.withOpacity(0.5)
                                  : Colors.transparent,
                              child: ListTile(
                                title: SizedBox(
                                  height: 100,
                                  child: Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 200,
                                      height: 100,
                                      color: const Color(0xFFD9D9D9),
                                      child: widget.category == 'numbers'
                                          ? Image.asset(getTitle(shuffledTitles[
                                              index])) // Display image for numbers
                                          : Text(
                                              getTitle(shuffledTitles[
                                                  index]), // Display title for others
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void checkConnections() {
    if (selectedImagesIndex.length == 1 && selectedTitlesIndex.length == 1) {
      // Check if the selected items are a correct pair
      bool isCorrectPair = checkCorrectPair(
        shuffledImages[selectedImagesIndex[0]],
        shuffledTitles[selectedTitlesIndex[0]],
      );
      if (isCorrectPair) {
        // Handle the correct pair (e.g., show a success message, remove items, etc.)

        setState(() {
          shuffledImages.removeAt(selectedImagesIndex[0]);
          shuffledTitles.removeAt(selectedTitlesIndex[0]);
          selectedImagesIndex.clear();
          selectedTitlesIndex.clear();
        });

        // Check if all items are matched
        if (shuffledImages.isEmpty && shuffledTitles.isEmpty) {
          setState(() {
            allMatched = true;
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 1),
            content: Container(
              height: 70,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              color: Colors.red,
              child: const Text(
                'ГРЕШЕН ПАР!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
        setState(() {
          selectedImagesIndex.clear();
          selectedTitlesIndex.clear();
        });
      }
    }
  }

  bool checkCorrectPair(dynamic item1, dynamic item2) {
    return item1.runtimeType == item2.runtimeType && item1.title == item2.title;
  }

  String getImage(dynamic item) {
    if (item is Number) {
      return item.image;
    } else if (item is Shape) {
      return item.image;
    } else if (item is Greeting) {
      return item.image;
    } else if (item is Food) {
      return item.image;
    }
    return '';
  }

  String getTitle(dynamic item) {
    if (item is Number) {
      return item.numbersImage;
    } else if (item is Shape) {
      return item.title;
    } else if (item is Greeting) {
      return item.title;
    } else if (item is Food) {
      return item.title;
    }
    return '';
  }
}
