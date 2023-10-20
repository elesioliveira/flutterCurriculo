import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(children: [
      Container(
        color: Colors.orangeAccent,
        child: const Center(
          child: Text(
            '1',
            style: TextStyle(fontSize: 100),
          ),
        ),
      ),
      Container(
        color: Colors.red,
        child: const Center(
          child: Text(
            '2',
            style: TextStyle(fontSize: 100),
          ),
        ),
      ),
      Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            '3',
            style: TextStyle(fontSize: 100),
          ),
        ),
      ),
    ]);
  }
}
