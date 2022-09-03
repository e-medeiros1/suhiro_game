import 'package:bonfire/bonfire.dart';
import 'package:pacman_game/widgets/player/player.dart';

class PlayerSpriteSheet {
 //Idle 
  static Future<SpriteAnimation> get playerIdleLeft => SpriteAnimation.load(
        'fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 0),
        ),
      );
  static Future<SpriteAnimation> get playerIdleRight => SpriteAnimation.load(
        'fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
        ),
      );
//Run      
  static Future<SpriteAnimation> get playerRunLeft => SpriteAnimation.load(
        'fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 48),
        ),
      );
  static Future<SpriteAnimation> get playerRunRight => SpriteAnimation.load(
        'fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 48),
        ),
      );

  //Atack
  static Future<SpriteAnimation> get atackRight => SpriteAnimation.load(
        'atack_effect_right.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  //Dying
  static Future<SpriteAnimation> get dyingLeft => SpriteAnimation.load(
        'fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(120, 24),
        ),
      );
  static Future<SpriteAnimation> get dyingRight => SpriteAnimation.load(
        'fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 120),
        ),
      );

  //Grave
  static Future<SpriteAnimation> get simpleGrave => SpriteAnimation.load(
        'fHero_die.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.15,
          textureSize: Vector2(tileSize, tileSize),
          texturePosition: Vector2(0, 0),
        ),
      );
}
