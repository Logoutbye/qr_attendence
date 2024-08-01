import 'package:flutter/material.dart';
import 'package:qr_attendence/config/constants/assetspath.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/provider/company/create_employ_provider.dart';
import 'package:qr_attendence/provider/employ_provider/login_provider.dart';

class LoginEmployeeScreen extends StatefulWidget {
  const LoginEmployeeScreen({super.key});

  @override
  State<LoginEmployeeScreen> createState() => _LoginEmployeeScreenState();
}

class _LoginEmployeeScreenState extends State<LoginEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _createEmployee()async {
    Utils.dismissKeyboard(context);
  
      
      final email = _emailController.text;
      final password = _passwordController.text;
      Map<String, dynamic> data = {
      
        'email': email,
        'password': password
      };
      if(email.isEmpty){
        Utils.snackBar('please enter a email', context);
      }else if(password.isEmpty){
        Utils.snackBar('please enter a password', context);
      }else{
        await LoginEmployProvider().loginEmploy(data, context);
      }
      // Perform the create employee action here
      // You can access the input values using _usernameController.text, _emailController.text, and _passwordController.text

      
    
  }

  @override
  void dispose() {
   
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
        final width=MediaQuery.of(context).size.width;

    return Container(
      decoration:
          BoxDecoration(gradient: AppConstantsWidgetStyle.kgradientScreen),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Themecolor.white,
              )),
          title: const Text(
            'Create Employee',
            style: TextStyle(color: Themecolor.white),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              // color: Themecolor.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AssetPaths.qrlogos,height:height*0.4,width: width*0.8,),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      fillColor: Themecolor.white,
                      filled: true,
                      hintText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      fillColor: Themecolor.white,
                      filled: true,
                      hintText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32.0),
                  Center(
                    // child: ElevatedButton(
                    //   onPressed: _createEmployee,
                    //   child: const Text('Create'),
                    // ),
                    child: InkWell(
                      onTap: _createEmployee,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient:const LinearGradient(
                            colors: [
                              Themecolor.primary,
                              Themecolor.primaryLight
                            ],
                            // colors:[Themecolor.primary,  Themecolor.primaryLight],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:const Center(
                            child: Text(
                          'Login in',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
