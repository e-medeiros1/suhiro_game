import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/widgets/coins/coins_sprite_sheet.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy.dart';
import 'package:pacman_game/widgets/player/player.dart';

int totalCoins = 1;

StreamController totalScore = StreamController<int>.broadcast();

class Coins extends GameDecoration with Sensor {
  Coins({required Vector2 position})
      : super.withAnimation(
            animation: CoinSpriteSheet.coins,
            position: position,
            size: Vector2(4, 4)) {
    // call this method to configure sensor area.
    setupSensorArea(areaSensor: [
      CollisionArea.rectangle(
        size: Vector2(10, 10),
        align: Vector2(-3, -3),
      ),
    ]);
  }

  @override
  void onContact(GameComponent component) {
    if (component is GamePlayer) {
      totalScore.sink.add(totalCoins++);
    } else if (component is NecroEnemy) {
    }

    removeFromParent();
  }

  @override
  void onContactExit(GameComponent component) {}
}
