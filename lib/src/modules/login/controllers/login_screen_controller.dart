import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:netroxe/src/modules/home/home_screen.dart';
import 'package:netroxe/src/modules/register/register_screen.dart';
import 'package:netroxe/src/resources/base_repository.dart';
import 'package:netroxe/src/utils/app_styles.dart';
import 'package:netroxe/src/utils/shared_preferences_data_provider.dart';

class LoginScreenController extends GetxController {
  var isBusy = false.obs;

   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

   var formKey = GlobalKey<FormState>();

   var repository = BaseRepository();
   var preferences = SharedPreferencesDataProvider();

  void login() async {
    isBusy(true);
    if(!formKey.currentState!.validate()){
      return;
    }

    try{
     var response = await repository.login(emailController.text, passwordController.text);
     if(response == null){
       Fluttertoast.showToast(msg: "Incorrect email or password",backgroundColor: AppColors.red);
     }

     // saving user details to shared prefs to check logged in status, in real life case it could be a authentication token
     preferences.saveUserName(response!.name!);
     preferences.saveUserMail(response.email!);
     Fluttertoast.showToast(msg: "Login success");
     Get.offAllNamed(HomeScreen.routeName);
    }catch(_){
      debugPrint(_.toString());
    }

    isBusy(false);
  }

  void gotoRegister(){
    Get.toNamed(RegisterScreen.routeName);
  }
}
