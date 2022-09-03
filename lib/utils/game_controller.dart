import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/screens/map_render/map_render.dart';
import 'package:pacman_game/utils/home_page.dart';
import 'package:pacman_game/widgets/coins/coins.dart';

class MyGameController extends GameComponent {
  bool endGame = false;
  bool gameOver = false;

  @override
  void update(double dt) {
    if (checkInterval('end game', 500, dt)) {
      if ((gameRef.livingEnemies().isEmpty && totalCoins == 31) && !endGame) {
        endGame = true;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text('Parabéns! Você ganhou!!'),
              actions: [
                TextButton(
                  onPressed: () {
                    _goHome();
                  },
                  child: const Text('Voltar ao menu principal',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                ),
                TextButton(
                  onPressed: () {
                    _goStage();
                  },
                  child: const Text('Jogar novamente',
                      style: TextStyle(fontSize: 14, color: Colors.orange)),
                )
              ],
            );
          },
        );
      }
    }

    if (checkInterval('gameover', 500, dt)) {
      if (gameRef.player?.isDead == true && !gameOver) {
        gameOver = true;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text('FIM DE JOGO'),
              actions: [
                TextButton(
                  onPressed: () {
                    _goStage();
                  },
                  child: const Text('Tentar novamente',
                      style: TextStyle(fontSize: 14, color: Colors.orange)),
                )
              ],
            );
          },
        );
      }
    }

    super.update(dt);
  }

  void _goStage() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const MapRender();
      }),
      (route) => false,
    );
  }

  void _goHome() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const HomePage();
      }),
      (route) => false,
    );
  }
}
