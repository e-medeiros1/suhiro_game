import 'package:bonfire/bonfire.dart';

class CoinSpriteSheet {

       static Future<SpriteAnimation> get coins => SpriteAnimation.load(
        'coin_sheet.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(8, 8),
          texturePosition: Vector2(0, 0),
        ),
      );
}
