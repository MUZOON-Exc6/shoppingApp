import 'package:flutter/material.dart';
import 'package:navgiter/Utils/appRouts.dart';

//import 'package:untitled/HomeScreen%20.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: false),
      //home: HomeScreen(),
      initialRoute: '/home',
      onGenerateRoute: AppRouts.routManager,
    );
  }
}
