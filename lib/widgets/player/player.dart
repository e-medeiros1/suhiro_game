import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pacman_game/utils/basic_values.dart';
import 'package:pacman_game/widgets/coins/coins.dart';
import 'package:pacman_game/widgets/player/player_sprite_sheet.dart';
import 'dart:io' show Platform;

const tileSize = BasicValues.TILE_SIZE;
bool playerCanMove = true;

double life = 120;

class GamePlayer extends SimplePlayer with ObjectCollision {
  GamePlayer({required Vector2 position})
      : super(
          position: position,
          speed: Platform.isWindows ? tileSize * 4.5 : tileSize * 2.8,
          size: Vector2(tileSize, tileSize),
          life: life,
          animation: SimpleDirectionAnimation(
            idleRight: PlayerSpriteSheet.playerIdleRight,
            idleLeft: PlayerSpriteSheet.playerIdleLeft,
            runRight: PlayerSpriteSheet.playerRunRight,
            runLeft: PlayerSpriteSheet.playerRunLeft,
          ),
        ) {
//CollisionConfig
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
      width: 12,
      borderWidth: 1,
      height: 1.5,
      align: const Offset(3, -5),
      borderRadius: BorderRadius.circular(3),
    );
    super.render(canvas);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.id == 0 && event.event == ActionEvent.DOWN) {
      playerCanMove = false;
      _executeAttack();
    }
    if (event.event == ActionEvent.DOWN &&
        (event.id == 1 || event.id == LogicalKeyboardKey.space.keyId)) {
      playerCanMove = false;
      _executeAttack();
    }

    super.joystickAction(event);
  }

  void _executeAttack() {
    playerCanMove = false;
    if (totalCoins > 10) {
      simpleAttackMelee(
        damage: 20,
        sizePush: tileSize - 12,
        animationRight: PlayerSpriteSheet.atackRight,
        size: Vector2.all(tileSize * 0.8),
      );
    } else if (totalCoins > 20) {
      simpleAttackMelee(
        damage: 20,
        sizePush: tileSize - 10,
        animationRight: PlayerSpriteSheet.atackRight,
        size: Vector2.all(tileSize * 1.2),
      );
    } else if (totalCoins > 25) {
      simpleAttackMelee(
        damage: 30,
        sizePush: tileSize - 8,
        animationRight: PlayerSpriteSheet.atackRight,
        size: Vector2.all(tileSize * 1.5),
      );
    }
  }

//Die
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
    totalCoins = 0;
    removeFromParent();

    super.die();
  }
}
