import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/utils/basic_values.dart';
import 'package:pacman_game/widgets/player/player_sprite_sheet.dart';

const tileSize = BasicValues.TILE_SIZE;

class GamePlayer extends SimplePlayer with ObjectCollision {
  bool canMove = true;

  GamePlayer({required Vector2 position})
      : super(
          position: position,
          speed: 80,
          size: Vector2(tileSize, tileSize),
          animation: SimpleDirectionAnimation(
            idleRight: PlayerSpriteSheet.playerIdleRight,
            idleLeft: PlayerSpriteSheet.playerIdleLeft,
            runRight: PlayerSpriteSheet.playerRunRight,
            runLeft: PlayerSpriteSheet.playerRunLeft,
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
    );

    super.render(canvas);
  }

  //Receive damage
  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify) {
    showDamage(
      damage,
      direction: DirectionTextDamage.RANDOM,
      config: const TextStyle(
        fontSize: 5,
        color: Colors.white,
        fontFamily: 'Normal',
      ),
    );
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die() async {
    if (lastDirectionHorizontal == Direction.left) {
      animation?.playOnce(PlayerSpriteSheet.dyingLeft,
          onFinish: () => removeFromParent());
    } else {
      animation?.playOnce(PlayerSpriteSheet.dyingRight,
          onFinish: () => removeFromParent());
    }

    final sprite = await PlayerSpriteSheet.simpleGrave;
    gameRef.add(
      GameDecoration.withSprite(
        sprite: sprite.getSprite(),
        position: Vector2(position.x, position.y),
        size: Vector2.all(tileSize),
      ),
    );
    super.die();
  }
}
