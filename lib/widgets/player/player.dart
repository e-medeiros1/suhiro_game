import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/widgets/player/player_sprite_sheet.dart';

class GamePlayer extends SimplePlayer {
  GamePlayer({required Vector2 position})
      : super(
          position: position,
          speed: 70,
          size: Vector2(32, 32),
          animation: SimpleDirectionAnimation(
            idleRight: PlayerSpriteSheet.playerIdleRight,
            idleLeft: PlayerSpriteSheet.playerIdleLeft,
            runRight: PlayerSpriteSheet.playerRunRight,
            runLeft: PlayerSpriteSheet.playerRunLeft,
          ),
        );
}
