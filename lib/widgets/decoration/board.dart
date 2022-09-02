import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy.dart';

class Board extends GameDecoration with TapGesture {
  Board({required Vector2 position})
      : super(
          position: position,
          size: Vector2(tileSize, tileSize),
        );

  @override
  void onTap() {
    TalkDialog.show(
        context,
        [
          Say(
            text: [
              const TextSpan(text: 'Olá! Bem vindo ao meu jogo!\n'),
              const TextSpan(text: 'Colete todas as moedas para vencer.\n'),
            ],
          ),
          Say(
            text: [
              const TextSpan(text: 'Boa sorte! Você vai precisar...'),
            ],
          ),
        ],
        padding: const EdgeInsets.only(left: 160, right: 50));
  }
}
