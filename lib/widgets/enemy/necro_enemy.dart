import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/utils/basic_values.dart';
import 'package:pacman_game/widgets/coins/coins.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy_sprite_sheet.dart';
import 'dart:io' show Platform;

const tileSize = BasicValues.TILE_SIZE;
bool canMove = true;

class NecroEnemy extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement {
  NecroEnemy({required Vector2 position})
      : super(
          position: position,
          speed: Platform.isWindows ? 40 : 30,
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

//Life bar
  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      width: 10,
      borderWidth: 1,
      height: 1.5,
      align: const Offset(3, -5),
      borderRadius: BorderRadius.circular(3),
      borderColor: Colors.black87,
      colorsLife: [
        Colors.purple.shade200,
      ],
    );
    super.render(canvas);
  }

  //Receive damage
  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    showDamage(
      -damage,
      direction: DirectionTextDamage.RANDOM,
      config: TextStyle(
        fontSize: 5.5,
        color: Colors.purple.shade50,
      ),
    );
    super.receiveDamage(attacker, damage, identify);
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
              if (totalCoins > 20) {
                simpleAttackMelee(
                  damage: 30,
                  size: Vector2.all(tileSize),
                  withPush: true,
                  sizePush: tileSize - 8,
                  animationRight: NecroEnemySpriteSheet.atackRight,
                );
              } else {
                simpleAttackMelee(
                  damage: 20,
                  size: Vector2.all(tileSize),
                  sizePush: tileSize - 12,
                  withPush: true,
                  animationRight: NecroEnemySpriteSheet.atackRight,
                );
              }
            },
            radiusVision: tileSize * 4,
            margin: 4,
          );
        },
        notObserved: () {
          runRandomMovement(dt);
        },
        radiusVision: tileSize * 3,
      );
    }
    if (totalCoins > 26) {
      canMove = false;
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
    removeFromParent();
    super.die();
  }
}
