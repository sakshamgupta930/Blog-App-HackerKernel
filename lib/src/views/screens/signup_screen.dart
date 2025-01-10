import 'package:blog_app/core/theme/colors.dart';
import 'package:blog_app/src/controllers/signup_controller.dart';
import 'package:blog_app/src/views/widgets/bubble.dart';
import 'package:blog_app/src/views/widgets/roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              BubbleContainer(size: size.height * .15),
              BubbleContainer(size: size.height * .15),
              Positioned(
                top: size.height * .2,
                right: size.width * .07,
                child: BubbleContainer(size: size.height * .05),
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: size.height * .07),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/icon.jpg',
                          height: size.height * .2,
                        ),
                      ),
                      SizedBox(height: size.height * .02),
                      Text(
                        'Create an account',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: size.height * .04),
                      TextFormField(
                        controller: signupController.fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          prefixIcon: Icon(Icons.password),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * .03),
                      TextFormField(
                        controller: signupController.emailController,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email_rounded)),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * .03),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        controller: signupController.passwordController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * .06),
                      Obx(
                        () => RoundButton(
                          isLoading: signupController.isLoading.value,
                          title: 'Sign up',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              signupController.registerUser(
                                signupController.emailController.text.trim(),
                                signupController.passwordController.text.trim(),
                                signupController.fullNameController.text.trim(),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: size.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                      Text('or'),
                      SizedBox(height: size.height * .02),
                      InkWell(
                        borderRadius: BorderRadius.circular(60),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/google.png',
                            height: size.height * .05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
