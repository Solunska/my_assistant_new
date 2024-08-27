import 'package:flutter/material.dart';
import 'package:my_assistant/UI/category_button.dart';
import 'package:my_assistant/UI/gradient_background.dart';
import 'package:my_assistant/screens/connect.dart';
import 'package:my_assistant/screens/learning.dart';
import 'package:my_assistant/screens/questions.dart';

class CategoriesScreen extends StatelessWidget {
  final String appBarLabel;
  final double appBarFontSize;
  final String gameMode;

  const CategoriesScreen(
      {super.key,
      required this.appBarLabel,
      required this.appBarFontSize,
      required this.gameMode});

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
          title: Text(
            appBarLabel,
            style: TextStyle(
              fontSize: appBarFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFFF0F0F6),
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
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: 500,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 60),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 60,
                  crossAxisSpacing: 10,
                  children: [
                    CustomButton(
                      image: 'assets/numbers.png',
                      label: 'БРОЈКИ',
                      onPressed: () {
                        if (gameMode == 'connect') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Connect(
                                label: 'ПОВРЗИ ГИ\nБРОЕВИТЕ',
                                category: 'numbers',
                              ),
                            ),
                          );
                        } else if (gameMode == 'questions') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Questions(
                                label: 'ПОГОДИ ГИ\nБРОЕВИТЕ',
                                category: 'numbers',
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Learning(category: 'numbers'),
                            ),
                          );
                        }
                      },
                    ),
                    CustomButton(
                      image: 'assets/shapes.png',
                      label: 'ФОРМИ',
                      onPressed: () {
                        if (gameMode == 'connect') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Connect(
                                label: 'ПОВРЗИ ГИ\nФОРМИТЕ',
                                category: 'shapes',
                              ),
                            ),
                          );
                        } else if (gameMode == 'questions') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Questions(
                                label: 'ПОГОДИ ГИ\nФОРМИТЕ',
                                category: 'shapes',
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Learning(category: 'shapes'),
                            ),
                          );
                        }
                      },
                    ),
                    CustomButton(
                      image: 'assets/food.png',
                      label: 'ХРАНА',
                      onPressed: () {
                        if (gameMode == 'connect') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Connect(
                                label: 'ПОВРЗИ ЈА\nХРАНАТА',
                                category: 'foods',
                              ),
                            ),
                          );
                        } else if (gameMode == 'questions') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Questions(
                                label: 'ПОГОДИ ЈА\nХРАНАТА',
                                category: 'foods',
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Learning(category: 'foods'),
                            ),
                          );
                        }
                      },
                    ),
                    CustomButton(
                      image: 'assets/greetings-images/greetings.png',
                      label: 'ПОЗДРАВИ',
                      onPressed: () {
                        if (gameMode == 'connect') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Connect(
                                label: 'ПОВРЗИ ГИ\nПОЗДРАВИТЕ',
                                category: 'greetings',
                              ),
                            ),
                          );
                        } else if (gameMode == 'questions') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Questions(
                                label: 'ПОГОДИ ГИ\nПОЗДРАВИТЕ',
                                category: 'greetings',
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Learning(category: 'greetings'),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
