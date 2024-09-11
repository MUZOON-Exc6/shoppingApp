import 'package:flutter/material.dart';

class ReciveScreen extends StatelessWidget {
  ReciveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFEF9EB),
      appBar: AppBar(
        title: const Text("Jolly Chick Cart"),
        backgroundColor: const Color.fromARGB(255, 150, 93, 160),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bf.png'),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              height: 120,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 150, 93, 160)),
              child: Center(
                child: Text(
                  "Thanks .. Your Order is Recived Successfully",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
