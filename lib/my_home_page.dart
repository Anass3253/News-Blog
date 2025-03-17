import 'package:flutter/material.dart';
import 'package:news_blog/features/main/main_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            },
            child: Text('Click me'),),
      ),
    );
  }
}
