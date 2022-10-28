import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pacman_game/utils/home_page.dart';
import 'package:pacman_game/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PressStart2P'),
      debugShowCheckedModeBanner: false,
      routes: {
        NamedRoutes.HOME_PAGE: (_) => const HomePage(),
      },
      initialRoute: NamedRoutes.HOME_PAGE,
      );
  }
}
