import 'dart:math';

import 'package:flutter/material.dart';

class SinglePlayer extends StatefulWidget {
  const SinglePlayer({Key? key}) : super(key: key);

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  var playerPiece = 'assets/images/questionMark2.png';
  var aiPiece = 'assets/images/questionMark1.png';
  bool moveChosen = false;
  dynamic result = '';
  int playerScore = 0;
  int streak = 0;

  dynamic playerMove(var playerMove) {
    Random random = Random();
    var aiMove = random.nextInt(3) + 1;

    setState(() {
      playerPiece = 'assets/images/$playerMove.jpg';
      aiPiece = 'assets/images/$aiMove.jpg';
      result = evaluate(playerMove, aiMove);

      if (result == "Won") {
        playerScore++;
        streak++;
      } else if (result == "Lost") {
        playerScore--;
        streak = 0;

        moveChosen = true;
        Future.delayed(const Duration(milliseconds: 3000), () {
          setState(() {
            playerPiece = 'assets/images/questionMark2.png';
            aiPiece = 'assets/images/questionMark1.png';
            result = 'Na';
            moveChosen = false;
          });
        });
      }
    });
  }

  dynamic evaluate(var playerMove, var aiMove) {
    if (playerMove == 3 && aiMove == 1) {
      return "Lost";
    } else if (playerMove == 1 && aiMove == 3) {
      return "Won";
    } else {
      if (playerMove > aiMove) {
        return "Won";
      } else if (playerMove == aiMove) {
        return "Draw";
      } else {
        return "Lost";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: (MediaQuery.of(context).size.width),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: (MediaQuery.of(context).size.width) * 0.95,
              color: (result == 'Won'
                  ? Colors.green
                  : ((result == 'Lost')
                      ? Colors.red
                      : (result == "Draw")
                          ? Colors.yellow
                          : Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Score : $playerScore",
                    style: const TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 25.0,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Streak : $streak",
                    style: const TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 200,
                    width: (MediaQuery.of(context).size.width) * 0.95,
                    color: Colors.orange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          shape: const CircleBorder(),
                          onPressed: null,
                          child: Image.asset(
                            'assets/images/3.jpg',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        MaterialButton(
                          shape: const CircleBorder(),
                          onPressed: null,
                          child: Image.asset(
                            'assets/images/1.jpg',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        MaterialButton(
                          shape: const CircleBorder(),
                          onPressed: null,
                          child: Image.asset(
                            'assets/images/2.jpg',
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width) * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width) * 0.42,
                          color: Colors.blueGrey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              MaterialButton(
                                shape: const CircleBorder(),
                                onPressed: null,
                                child: Image.asset(
                                  playerPiece,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("VS"),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width) * 0.42,
                          color: Colors.orange,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              MaterialButton(
                                shape: const CircleBorder(),
                                onPressed: null,
                                child: Image.asset(
                                  aiPiece,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: (MediaQuery.of(context).size.width) * 0.95,
                    color: Colors.blueGrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          shape: const CircleBorder(),
                          onPressed: moveChosen
                              ? null
                              : () {
                                  playerMove(1);
                                },
                          child: Image.asset(
                            'assets/images/1.jpg',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        MaterialButton(
                          shape: const CircleBorder(),
                          onPressed: moveChosen
                              ? null
                              : () {
                                  playerMove(2);
                                },
                          child: Image.asset(
                            'assets/images/2.jpg',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        MaterialButton(
                          shape: const CircleBorder(),
                          onPressed: moveChosen
                              ? null
                              : () {
                                  playerMove(3);
                                },
                          child: Image.asset(
                            'assets/images/3.jpg',
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
