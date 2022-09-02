import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/utils/basic_values.dart';
import 'package:pacman_game/widgets/coins/coins.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy_sprite_sheet.dart';

const tileSize = BasicValues.TILE_SIZE;
bool canMove = true;

class NecroEnemy extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement {
  NecroEnemy({required Vector2 position})
      : super(
          position: position,
          speed: totalCoins == 20 ? 50 : 40,
          size: Vector2(tileSize, tileSize),
          animation: SimpleDirectionAnimation(
            idleRight: NecroEnemySpriteSheet.enemyIdleRight,
            idleLeft: NecroEnemySpriteSheet.enemyIdleLeft,
            runRight: NecroEnemySpriteSheet.enemyRunRight,
            runLeft: NecroEnemySpriteSheet.enemyRunLeft,
          ),
        ) {
//Seta colisão
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

//Ataca ao ver
  @override
  void update(double dt) {
    if (canMove) {
      seePlayer(
        observed: (player) {
          seeAndMoveToPlayer(
            //Quando tiver próximo do player, faz:
            closePlayer: (player) {
              simpleAttackMelee(
                damage: totalCoins == 20 ? 30 : 20,
                size: Vector2(tileSize, tileSize),
                withPush: true,
                animationRight: NecroEnemySpriteSheet.atackRight,
              );
            },
            radiusVision: tileSize * 3,
            margin: 4,
          );
        },
        notObserved: () {
          runRandomMovement(dt);
        },
        radiusVision: tileSize * 3,
      );
    }
    super.update(dt);
  }

//Death
  @override
  void die() {
    gameRef.add(
      AnimatedObjectOnce(
        animation: NecroEnemySpriteSheet.smokeExplosion,
        position: Vector2(position.x, position.y),
        size: Vector2.all(tileSize),
      ),
    );
    canMove = false;
    removeFromParent();
    super.die();
  }
}
