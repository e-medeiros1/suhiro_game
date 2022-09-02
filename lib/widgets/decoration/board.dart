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
              const TextSpan(
                  text: 'Olá! Bem vindo ao meu jogo!\n',
                  style: TextStyle(fontFamily: 'PressStart2P')),
              const TextSpan(
                  text:
                      'Colete todos os tesouros do mapa enquanto luta contra monstros.\n',
                  style: TextStyle(fontFamily: 'PressStart2P')),
            ],
          ),
          Say(
            text: [
              const TextSpan(
                  text: 'Boa sorte! Você vai precisar...',
                  style: TextStyle(fontFamily: 'PressStart2P')),
            ],
          ),
        ],
        padding: const EdgeInsets.only(left: 160, right: 50));
  }
}
