import 'package:blog_app/core/theme/colors.dart';
import 'package:blog_app/src/views/screens/signup_screen.dart';
import 'package:blog_app/src/views/widgets/bubble.dart';
import 'package:blog_app/src/views/widgets/roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Login'),
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
                          'Welcome to Blog App',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: size.height * .08),
                        TextFormField(
                          controller: emailController,
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
                          controller: passwordController,
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
                        RoundButton(
                          title: 'Login',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                        ),
                        SizedBox(height: size.height * .01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Get.to(() => SignupScreen());
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                        Text('or'),
                        SizedBox(height: size.height * .01),
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
      ),
    );
  }
}
