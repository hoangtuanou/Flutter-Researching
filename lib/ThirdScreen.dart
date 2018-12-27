import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  final String name;

  ThirdScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Container(
        child: Text(
          name
        ),
      )
    );
  }
}