import 'package:flutter/material.dart';
import 'package:pomodoro/screens/home_screen.dart';

void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFE7626C),
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Color(0xFF232B55)),
        ),
        cardColor: const Color(0xffF4EDDB),
      ),
      home: HomeScreen(),
    );
  }
}
