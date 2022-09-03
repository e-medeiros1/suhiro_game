import 'package:bonfire/bonfire.dart';

class NecroEnemySpriteSheet {
//Idle
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
      
//Run      
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

//Death
  static Future<SpriteAnimation> get smokeExplosion => SpriteAnimation.load(
        'smoke_explosion.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
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

}
