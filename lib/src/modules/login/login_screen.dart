import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netroxe/src/modules/login/controllers/login_screen_controller.dart';
import 'package:netroxe/src/utils/app_styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  final controller = Get.find<LoginScreenController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const Text("Login",style: AppTextStyles.appHeader,),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      hintText: "Enter your email address"
                    ),
                    validator: (value) {
                      if(value==null || value.isEmpty || !value.isEmail){
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter your email address"
                    ),
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return "Enter a valid password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30,),
                  MaterialButton(onPressed: controller.login,color: AppColors.primary,child: const Text("Login"),),
                  const SizedBox(height: 20,),
                  RichText(text: TextSpan(
                    text: "Don't have an account? ",
                    style: AppTextStyles.appContentMedium,
                    children: [
                      TextSpan(
                        text: "Register",
                        style: const TextStyle(color: AppColors.primary,fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()..onTap = controller.gotoRegister
                      )
                    ]
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
