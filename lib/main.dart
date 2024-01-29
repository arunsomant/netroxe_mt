
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:netroxe/src/configs/app_config.dart';
import 'package:netroxe/src/model/note.dart';
import 'package:netroxe/src/model/user.dart';
import 'package:netroxe/src/modules/splash/splash_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'src/utils/app_styles.dart';
import 'src/routes/routes.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter<Note>(NoteAdapter());


  const secureStorage = FlutterSecureStorage();
  // if key not exists return null
  final encryptionKeyString = await secureStorage.read(key: 'key');
  if (encryptionKeyString == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'key',
      value: base64UrlEncode(key),
    );
  }
  final key = await secureStorage.read(key: 'key');
  final encryptionKeyUint8List = base64Url.decode(key!);
  await Hive.openBox<User>(AppConfig.appUserBox, encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
  await Hive.openBox<Note>(AppConfig.appNotesBox);
  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Netroxe',
      onGenerateTitle: (BuildContext context) => 'Netroxe',
      theme: AppThemes.appTheme, // todo change this to support dark mode later
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      initialRoute: SplashScreen.routeName,
      getPages: Routes.getPages,
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);

        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              navigationMode: NavigationMode.directional,),
          child: Container(
            transformAlignment: FractionalOffset.center,
            height: mediaQueryData.size.height,
            width: mediaQueryData.size.width,
            child: child,
          ),
        );
      },
    );
  }
}
