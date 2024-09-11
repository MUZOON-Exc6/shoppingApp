import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 189, 165, 232),
        title: const Text("Jolly Chick Stor"),
      ),
      backgroundColor: const Color(0XFFFEF9EB),
      body: const Center(
        child: Text("Not Found Screen 404"),
      ),
    );
  }
}
