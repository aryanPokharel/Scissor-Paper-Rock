import 'package:flutter/material.dart';
import 'package:scissor_paper_rock/screens/Leaderboards.dart';
import 'package:scissor_paper_rock/screens/SinglePlayer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/homeBg.png'),
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: (() => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SinglePlayer()),
                                )
                              }),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Text("Single Player"),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: (() => {print("Multiplayer")}),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber),
                          child: const Text("Multiplayer"),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: (() => {print("Multiplayer")}),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Text("Online"),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: (() => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LeaderBoards()),
                                )
                              }),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan),
                          child: const Text("Leaderboards"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
