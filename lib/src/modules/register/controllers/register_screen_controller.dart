import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:netroxe/src/resources/base_repository.dart';

class RegisterScreenController extends GetxController {
  var isBusy = false.obs;

   TextEditingController nameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

   var formKey = GlobalKey<FormState>();

   var repository = BaseRepository();

  void register() async {
    isBusy(true);
    if(!formKey.currentState!.validate()){
      return;
    }
    try{
      var response = await repository.register(nameController.text, emailController.text, passwordController.text);
      if(response){
        Fluttertoast.showToast(msg: "Registration success. Please login.");
        Get.back();
      }else{
        Fluttertoast.showToast(msg: "Registration failed. Email already used!");
      }
    }catch(_){
      debugPrint(_.toString());
    }

    isBusy(false);
  }
}
