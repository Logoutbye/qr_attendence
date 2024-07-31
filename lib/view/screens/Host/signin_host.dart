import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/config/constants/assetspath.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/provider/Signin_provider.dart';

class SignInHost extends StatefulWidget {
  const SignInHost({super.key});

  @override
  State<SignInHost> createState() => _SignInHostState();
}

class _SignInHostState extends State<SignInHost> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<SigninProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: AppConstantsWidgetStyle.kgradientScreen,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                'signin',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Themecolor.white),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                height: height * 0.9,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Themecolor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetPaths.qrlogos,width: width*0.9,height: height*0.4,),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'enter your email',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Themecolor.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Themecolor.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Themecolor.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Themecolor.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      controller: passwordController,
                      obscureText: provider.isPassword,
                      decoration: InputDecoration(
                        hintText: 'enter your password',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Themecolor.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Themecolor.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Themecolor.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Themecolor.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(provider.isPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            provider
                                ?.setPasswordVisibility(!provider.isPassword);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    InkWell(
                      onTap: () async {
                        // Navigator.pushReplacementNamed(context, RoutesName.hostDashboard);
                        final email = emailController.text;
                        final password = passwordController.text;
                        Map<String, dynamic> data = {
                          'email': email,
                          'password': password
                        };
                        if (email.isEmpty) {
                        Utils.snackBar('Please enter Email', context);
                        } else if (password.isEmpty) {
                          Utils.snackBar('Please enter password', context);
                        } else {
                          await provider.companySignin(data, context);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Themecolor.primary,
                              Themecolor.primaryLight
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: Text(
                          'Sign in',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'New user? ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                              color: Themecolor.orange,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Define your onTap function here
                                Navigator.pushReplacementNamed(
                                    context, RoutesName.signUp);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
