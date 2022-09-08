import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/screens/map_render/map_render.dart';
import 'package:pacman_game/utils/home_page.dart';
import 'package:pacman_game/widgets/coins/coins.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy.dart';

class MyGameController extends GameComponent {
  bool endGame = false;
  bool gameOver = false;

  @override
  void update(double dt) {
    if (checkInterval('end game', 500, dt)) {
      if ((gameRef.livingEnemies().isEmpty && totalCoins > 30) && !endGame) {
        endGame = true;
        showDialog(
          context: context,
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.yellow.shade500.withOpacity(0.4),
              body: Center(
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                ),
              ),
            );
          },
        );
      }
    }

    Future<Widget> dialogDelay()  {
      return Future.delayed(
          Duration(seconds: 1),
          () => Scaffold(
                backgroundColor: Colors.red.shade500.withOpacity(0.5),
                body: Center(
                  child: AlertDialog(
                    actionsAlignment: MainAxisAlignment.center,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    content: const Text('Você morreu! Fim de jogo!!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _goStage();
                        },
                        child: const Text('Tentar novamente',
                            style:
                                TextStyle(fontSize: 14, color: Colors.orange)),
                      )
                    ],
                  ),
                ),
              ));
    }

    if (checkInterval('gameover', 500, dt)) {
      if (gameRef.player?.isDead == true && !gameOver) {
        gameOver = true;
        showDialog(
          context: context,
          builder: (context) {
            return Scaffold(
                backgroundColor: Colors.red.shade500.withOpacity(0.5),
                body: Center(
                  child: AlertDialog(
                    actionsAlignment: MainAxisAlignment.center,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    content: const Text('Você morreu! Fim de jogo!!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _goStage();
                        },
                        child: const Text('Tentar novamente',
                            style:
                                TextStyle(fontSize: 14, color: Colors.orange)),
                      )
                    ],
                  ),
                ),
              );
          },
        );
      }
    }

    super.update(dt);
  }

  void _goStage() {
    totalCoins = 1;
    canMove = true;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const MapRender();
      }),
      (route) => false,
    );
  }

  void _goHome() {
    totalCoins = 1;
    canMove = true;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const HomePage();
      }),
      (route) => false,
    );
  }
}
