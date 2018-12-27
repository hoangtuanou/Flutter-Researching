import 'package:flutter/material.dart';

import 'SecondScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        buttonColor: Colors.red,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: SecondScreen(),
    );
  }
}
