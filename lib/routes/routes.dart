import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:laptrinhmang/page/Username/index.dart';

import '../Page/Home/index.dart';
import '../Page/InputServer/index.dart';

class Routes {
  // ignore: constant_identifier_names
  static const String input_server = '/input_server';
  static const String home = '/home';
  static const String profile = '/profile';

  static const String login = '/login';
  // ignore: constant_identifier_names
  static const String user_name = '/user_name';
}

class AppNavigate {
  static final screens = [
    GetPage(name: Routes.input_server, page: () => const InputServer()),
    GetPage(name: Routes.home, page: () => const Home()),
    GetPage(name: Routes.user_name, page: () => const Username())
  ];
}
