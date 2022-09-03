import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/widgets/coins/coins.dart';

class PlayerInterface extends StatefulWidget {
  final BonfireGame game;

  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder<dynamic>(
            stream: totalScore.stream,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  snapshot.data != null
                      ? 'Pontuação: ${snapshot.data}'
                      : 'Pontuação: 0',
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'PressStart2P'),
                ),
              );
            }));
  }
}
