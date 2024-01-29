import 'package:get/get.dart';
import 'package:netroxe/src/modules/home/home_screen.dart';
import 'package:netroxe/src/modules/login/login_screen.dart';
import 'package:netroxe/src/utils/shared_preferences_data_provider.dart';

class SplashScreenController extends GetxController {
  var isBusy = false.obs;

  var prefs = SharedPreferencesDataProvider();
  @override
  void onInit() {
    gotoLoginPage();
    super.onInit();
  }

  void gotoLoginPage() async {
    isBusy(true);
    await Future.delayed(const Duration(seconds: 2)).then((value) async{
     String name = await prefs.getUserName();
     if(name.isEmpty) {
       Get.offAllNamed(LoginScreen.routeName);
     }else{
       Get.offAllNamed(HomeScreen.routeName);
     }
    });
    isBusy(false);
  }
}
