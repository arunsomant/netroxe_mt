import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netroxe/src/modules/register/controllers/register_screen_controller.dart';
import 'package:netroxe/src/utils/app_styles.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';
  final controller = Get.find<RegisterScreenController>();
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
                  const Text("Register",style: AppTextStyles.appHeader,),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                        hintText: "Enter your name"
                    ),
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return "Enter a valid name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
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
                  MaterialButton(onPressed: controller.register,color: AppColors.primary,child: const Text("Register"),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
