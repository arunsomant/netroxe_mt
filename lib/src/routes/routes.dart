import 'package:get/get.dart';
import 'package:netroxe/src/modules/home/controllers/home_screen_controller.dart';
import 'package:netroxe/src/modules/home/home_screen.dart';
import 'package:netroxe/src/modules/login/controllers/login_screen_controller.dart';
import 'package:netroxe/src/modules/login/login_screen.dart';
import 'package:netroxe/src/modules/note/controllers/note_controller.dart';
import 'package:netroxe/src/modules/note/note_create_screen.dart';
import 'package:netroxe/src/modules/register/controllers/register_screen_controller.dart';
import 'package:netroxe/src/modules/register/register_screen.dart';
import 'package:netroxe/src/modules/splash/controllers/splash_screen_controller.dart';
import 'package:netroxe/src/modules/splash/splash_screen.dart';

class Routes {
  static var getPages = [
    GetPage(
        name: SplashScreen.routeName,
        page: () => SplashScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => SplashScreenController()),)),
    GetPage(
        name: LoginScreen.routeName,
        page: () => LoginScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => LoginScreenController()),)),
    GetPage(
        name: RegisterScreen.routeName,
        page: () => RegisterScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => RegisterScreenController()),)),
    GetPage(
        name: HomeScreen.routeName,
        page: () => HomeScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => HomeScreenController()),)),
    GetPage(
        name: NoteCreateScreen.routeName,
        page: () => NoteCreateScreen(),
        binding: BindingsBuilder(() => Get.lazyPut(() => NoteController()),)),
  ];
}
