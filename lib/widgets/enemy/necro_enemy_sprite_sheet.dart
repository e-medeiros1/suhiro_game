import 'package:bonfire/bonfire.dart';

class NecroEnemySpriteSheet {
  static Future<SpriteAnimation> get enemyIdleLeft => SpriteAnimation.load(
        'necromancer_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 0),
        ),
      );
  static Future<SpriteAnimation> get enemyIdleRight => SpriteAnimation.load(
        'necromancer_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
        ),
      );
  static Future<SpriteAnimation> get enemyRunLeft => SpriteAnimation.load(
        'necromancer_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(96, 24),
        ),
      );
  static Future<SpriteAnimation> get enemyRunRight => SpriteAnimation.load(
        'necromancer_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 24),
        ),
      );
}
