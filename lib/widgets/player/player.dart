import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/utils/basic_values.dart';
import 'package:pacman_game/widgets/player/player_sprite_sheet.dart';

const tileSize = BasicValues.TILE_SIZE;

class GamePlayer extends SimplePlayer with ObjectCollision {
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

  //Método onColision
}
