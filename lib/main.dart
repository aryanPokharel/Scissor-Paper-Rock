import 'package:flutter/material.dart';
import 'package:scissor_paper_rock/screens/Home.dart';
import 'package:scissor_paper_rock/screens/SinglePlayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/singlePlayer': (context) => const SinglePlayer()
      },
      debugShowCheckedModeBanner: false,
    ));
  }
}
