import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scissor_paper_rock/screens/Home.dart';
import 'package:scissor_paper_rock/screens/Leaderboards.dart';
import 'package:scissor_paper_rock/screens/SinglePlayer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
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
        '/singlePlayer': (context) => const SinglePlayer(),
        '/leaderboards': (context) => const LeaderBoards()
      },
      debugShowCheckedModeBanner: false,
    ));
  }
}
