import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFFFFFFF),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        appBarTheme: const AppBarTheme(color: Color(0xFFFFFFFF)),//FFFFFFFF
      ),
      home: LoginPage(),
    );
  }
}
