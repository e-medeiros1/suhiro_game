import 'package:bonfire/bonfire.dart';

class HeartSpriteSheet {
  static Future<SpriteAnimation> get heart => SpriteAnimation.load(
        'heart_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 7,
          stepTime: 0.3,
          textureSize: Vector2(8, 8),
          texturePosition: Vector2(0, 0),
        ),
      );
}
