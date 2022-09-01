import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/utils/basic_values.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy_sprite_sheet.dart';

const tileSize = BasicValues.TILE_SIZE;

class NecroEnemy extends SimpleEnemy with ObjectCollision {
  NecroEnemy({required Vector2 position})
      : super(
          position: position,
          speed: 50,
          size: Vector2(tileSize, tileSize),
          animation: SimpleDirectionAnimation(
            idleRight: NecroEnemySpriteSheet.enemyIdleRight,
            idleLeft: NecroEnemySpriteSheet.enemyIdleLeft,
            runRight: NecroEnemySpriteSheet.enemyRunRight,
            runLeft: NecroEnemySpriteSheet.enemyRunLeft,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize - 10, tileSize - 10),
            align: Vector2(5, 11),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {},
      radiusVision: tileSize * 2,
      margin: 4,
    );
    super.update(dt);
  }
}
