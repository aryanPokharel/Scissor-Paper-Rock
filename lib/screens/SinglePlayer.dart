import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

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
  AudioCache audioCache = AudioCache();

  dynamic playerMove(var playerMove) {
    Random random = Random();
    var aiMove = random.nextInt(3) + 1;

    setState(() {
      playerPiece = 'assets/images/$playerMove.jpg';
      aiPiece = 'assets/images/$aiMove.jpg';
      result = evaluate(playerMove, aiMove);
      AudioPlayer player = AudioPlayer();
      player.play(AssetSource('assets/sounds/win.mp3'));
      // player.setSource(AssetSource('assets/sounds/win.mp3')).then((value) {
      //   player.play(AssetSource('assets/sounds/win.mp3'));
      // });

      if (result == "Won") {
        MotionToast(
                primaryColor: Colors.green,
                width: 320,
                height: 80,
                title: const Text("Won!"),
                description: const Text(""),
                icon: Icons.handshake)
            .show(context);
        playerScore++;
      } else if (result == "Lost") {
        MotionToast(
                primaryColor: Colors.red,
                width: 320,
                height: 80,
                title: const Text("Lost!"),
                description: const Text(""),
                icon: Icons.error)
            .show(context);
        playerScore--;
      } else {
        MotionToast(
                primaryColor: Colors.yellow,
                width: 320,
                height: 80,
                title: const Text("Draw!"),
                description: const Text(""),
                icon: Icons.warning)
            .show(context);
      }
      moveChosen = true;
      Future.delayed(const Duration(milliseconds: 600), () {
        setState(() {
          playerPiece = 'assets/images/questionMark2.png';
          aiPiece = 'assets/images/questionMark1.png';
          moveChosen = false;
        });
      });
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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text("Your Move"),
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
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("VS : $result"),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const Text("AI's Move"),
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
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Choose Your Move"),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10),
                Row(
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
                const SizedBox(
                  height: 10,
                ),
                Text("Score : $playerScore"),
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
