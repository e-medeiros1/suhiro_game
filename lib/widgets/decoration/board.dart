import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy_sprite_sheet.dart';
import 'package:pacman_game/widgets/player/player_sprite_sheet.dart';

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
                    'Colete o máximo de moedas que conseguir e mate todos os monstros para vencer.\n',
                style: TextStyle(fontFamily: 'PressStart2P')),
          ],
          personSayDirection: PersonSayDirection.LEFT,
          person: SizedBox(
            width: 100,
            height: 100,
            child: PlayerSpriteSheet.playerIdleRight.asWidget(),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              text:
                  'Quanto mais coletar, mais forte ficará! Seus inimigos não gostarão nada disso...\n',
              style: TextStyle(fontFamily: 'PressStart2P'),
            ),
            const TextSpan(
              text: 'Boa sorte, nós vamos precisar!',
              style: TextStyle(fontFamily: 'PressStart2P'),
            ),
          ],
          personSayDirection: PersonSayDirection.LEFT,
          person: SizedBox(
            width: 100,
            height: 100,
            child: PlayerSpriteSheet.playerIdleRight.asWidget(),
          ),
        ),
        Say(
          text: [
            const TextSpan(
              text: 'Aaarhg... Vão mesmo!',
              style: TextStyle(fontFamily: 'PressStart2P'),
            ),
          ],
          personSayDirection: PersonSayDirection.RIGHT,
          person: SizedBox(
            width: 100,
            height: 100,
            child: NecroEnemySpriteSheet.enemyIdleRight.asWidget(),
          ),
        ),
      ],
    );
  }
}
