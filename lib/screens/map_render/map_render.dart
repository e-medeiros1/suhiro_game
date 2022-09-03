import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_game/utils/basic_values.dart';
import 'package:pacman_game/utils/game_controller.dart';
import 'package:pacman_game/utils/player_interface.dart';
import 'package:pacman_game/widgets/coins/coins.dart';
import 'package:pacman_game/widgets/decoration/board.dart';
import 'package:pacman_game/widgets/decoration/bonfire.dart';
import 'package:pacman_game/widgets/enemy/necro_enemy.dart';
import 'package:pacman_game/widgets/player/player.dart';
import 'dart:io' show Platform;

class MapRender extends StatefulWidget {
  const MapRender({Key? key}) : super(key: key);

  @override
  State<MapRender> createState() => _MapRenderState();
}

class _MapRenderState extends State<MapRender> implements GameListener {
  late GameController controller;

  @override
  void initState() {
    controller = GameController()..addListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const tileSize = BasicValues.TILE_SIZE;
    return BonfireWidget(
      gameController: controller,
      overlayBuilderMap: {
        BasicValues.OVERLAY_KEY: ((context, game) =>
            PlayerInterface(game: game)),
      },
      //Camera
      cameraConfig: CameraConfig(
        smoothCameraEnabled: true,
        moveOnlyMapArea: true,
        zoom: Platform.isWindows ? 2.0 : 2.5,
        sizeMovementWindow: Platform.isWindows
            ? Vector2(tileSize * 25, tileSize * 5)
            : Vector2(tileSize * 15, tileSize * 5),
      ),
      components: [MyGameController()],
      initialActiveOverlays: const [
        BasicValues.OVERLAY_KEY,
      ],
      //Joystic
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
            enable: Platform.isWindows ? true : false,
            keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows),
        directional: JoystickDirectional(
          spriteBackgroundDirectional: Sprite.load('joystick_background.png'),
          spriteKnobDirectional: Sprite.load('joystick_knob.png'),
          size: 100,
        ),
        actions: [
          if (Platform.isAndroid)
            JoystickAction(
              actionId: 0,
              sprite: Sprite.load('joystick_atack.png'),
              spritePressed: Sprite.load('joystick_atack_selected.png'),
              size: 80,
              margin: const EdgeInsets.only(bottom: 50, right: 80),
            ),
        ],
      ),
      //Map Render
      map: WorldMapByTiled(
        'map/pacmap.json',
        objectsBuilder: {
          'necro': (properties) => NecroEnemy(position: properties.position),
          'bonfire': (properties) => Lamp(position: properties.position),
          'coin': (properties) => Coins(position: properties.position),
          'board': (properties) => Board(position: properties.position),
        },
      ),
      //Player
      player: GamePlayer(
        position: Vector2(tileSize * 25, tileSize * 20),
      ),
      //Lighting
      lightingColorGame: Colors.black.withOpacity(0.15),
    );
  }

  @override
  void changeCountLiveEnemies(int count) {}

  @override
  void updateGame() {}
}
