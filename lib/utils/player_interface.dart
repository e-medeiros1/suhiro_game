import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async;

import 'package:pacman_game/widgets/coins/coins.dart';

class PlayerInterface extends StatefulWidget {
  final BonfireGame game;
  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  int totalScore = 0;

  @override
  void didUpdateWidget(covariant PlayerInterface oldWidget) {
    if (totalScore != totalCoins) {
      setState(() {
        totalScore = totalCoins;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Pontuação:',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: 'PressStart2P'),
            ),
            Text(
              totalScore.toString(),
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: 'PressStart2P'),
            ),
          ],
        ),
      ),
    );
  }
}
