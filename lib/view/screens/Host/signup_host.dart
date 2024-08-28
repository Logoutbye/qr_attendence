

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_attendence/config/routes/routes_name.dart';
// import 'package:qr_attendence/config/theme/theme.dart';
// import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
// import 'package:qr_attendence/core/utilis/utils.dart';
// import 'package:qr_attendence/provider/signup_provider.dart';

// class SignUpHost extends StatefulWidget {
//   const SignUpHost({super.key});

//   @override
//   State<SignUpHost> createState() => _SignUpHostState();
// }

// class _SignUpHostState extends State<SignUpHost> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false; // Add this line

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Container(
//       decoration: BoxDecoration(gradient: AppConstantsWidgetStyle.kgradientScreen),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           title: Text('Register Company', style: TextStyle(color: Themecolor.white)),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             height: height * 0.9,
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Themecolor.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   AuthField(
//                     controller: _usernameController,
//                     hintText: 'Your CompanyName',
//                     keyboardType: TextInputType.name,
//                     isPasswordField: false,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your username';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   AuthField(
//                     controller: _emailController,
//                     hintText: 'Your Email',
//                     keyboardType: TextInputType.emailAddress,
//                     isPasswordField: false,
//                     validator: (value) {
//                       if (value == null || value.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                         return 'Please enter a valid email address';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   AuthField(
//                     controller: _passwordController,
//                     hintText: 'Your Password',
//                     isPasswordField: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 30),
//                   Consumer<SignupProvider>(
//                     builder: (BuildContext context, provider, Widget? child) {
//                       return PrimaryButton(
//                         borderRadius: 10,
//                         onTap: () async {
//                           Utils.dismissKeyboard(context);
//                           if (_formKey.currentState!.validate()) {
//                             setState(() {
//                               _isLoading = true; // Set loading to true
//                             });
//                             final username = _usernameController.text;
//                             final email = _emailController.text;
//                             final password = _passwordController.text;
//                             Map<String, dynamic> data = {
//                               'companyName': username,
//                               'email': email,
//                               'password': password
//                             };
//                             await provider.companySignup(data, context);
//                             setState(() {
//                               _isLoading = false; // Set loading to false
//                             });
//                           }
//                         },
//                         text: 'Register',
//                         isLoading: _isLoading, // Pass the loading state
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 30),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Already a member?',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Themecolor.grey,
//                           )),
//                       CustomTextButton(
//                         onPressed: () {
//                           Navigator.pushReplacementNamed(context, RoutesName.signin);
//                         },
//                         text: 'Sign In',
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AuthField extends StatefulWidget {
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final String hintText;
//   final bool isPasswordField;
//   final TextInputType? keyboardType;
//   final List<TextInputFormatter>? inputFormatters;
//   final void Function(String)? onChanged;

//   const AuthField({
//     super.key,
//     required this.hintText,
//     required this.controller,
//     this.inputFormatters,
//     this.onChanged,
//     this.validator,
//     this.isPasswordField = false,
//     this.keyboardType,
//   });

//   @override
//   State<AuthField> createState() => _AuthFieldState();
// }

// class _AuthFieldState extends State<AuthField> {
//   bool isObscure = true;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       obscureText: widget.isPasswordField ? isObscure : false,
//       validator: widget.validator,
//       onChanged: widget.onChanged,
//       inputFormatters: widget.inputFormatters,
//       keyboardType: widget.keyboardType,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         errorMaxLines: 2,
//         filled: false,
//         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Themecolor.black),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Themecolor.black),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: Themecolor.black),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         suffixIcon: widget.isPasswordField
//             ? IconButton(
//                 icon: Icon(
//                   isObscure ? Icons.visibility : Icons.visibility_off,
//                   color: Themecolor.black,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     isObscure = !isObscure;
//                   });
//                 },
//               )
//             : null,
//       ),
//     );
//   }
// }





// class PrimaryButton extends StatefulWidget {
//   final VoidCallback onTap;
//   final String text;
//   final double? width;
//   final double? height;
//   final double? borderRadius;
//   final double? fontSize;
//   final Color? color;
//   final bool isLoading; // Added this line

//   const PrimaryButton({
//     required this.onTap,
//     required this.text,
//     this.height,
//     this.width,
//     this.borderRadius,
//     this.fontSize,
//     this.color,
//     this.isLoading = false, // Default to false
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<PrimaryButton> createState() => _PrimaryButtonState();
// }

// class _PrimaryButtonState extends State<PrimaryButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   final Duration _animationDuration = const Duration(milliseconds: 300);
//   final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);

//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: _animationDuration,
//     )..addListener(() {
//         setState(() {});
//       });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.isLoading
//           ? null // Disable tap when loading
//           : () {
//               _controller.forward().then((_) {
//                 _controller.reverse();
//               });
//               widget.onTap();
//             },
//       child: ScaleTransition(
//         scale: _tween.animate(
//           CurvedAnimation(
//             parent: _controller,
//             curve: Curves.easeOut,
//             reverseCurve: Curves.easeIn,
//           ),
//         ),
//         child: Card(
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: Container(
//             height: widget.height ?? 55,
//             alignment: Alignment.center,
//             width: widget.width ?? double.infinity,
//             decoration: BoxDecoration(
//               gradient: AppConstantsWidgetStyle.kgradientButton,
//               borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
//             ),
//             child: widget.isLoading
//                 ? SizedBox(
//                     width: widget.width ?? double.infinity,
//                     height: widget.height ?? 55,
//                     child: Center(
//                       child: CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                       ),
//                     ),
//                   )
//                 : Text(
//                     widget.text,
//                     style: TextStyle(
//                       color: widget.color ?? Colors.white,
//                       fontSize: widget.fontSize ?? 15,
//                     ),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// class CustomTextButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String text;
//   final Color? color;
//   final double? fontSize;

//   const CustomTextButton({
//     required this.onPressed,
//     required this.text,
//     this.fontSize,
//     this.color,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: onPressed,
//       style: TextButton.styleFrom(padding: EdgeInsets.zero),
//       child: Text(
//         text,
//         style: TextStyle(color: color ?? Themecolor.orange, fontSize: fontSize ?? 14),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

import 'package:provider/provider.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/core/components/app_constant_widget_style.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/provider/signup_provider.dart';

class SignUpHost extends StatefulWidget {
  const SignUpHost({super.key});

  @override
  State<SignUpHost> createState() => _SignUpHostState();
}

class _SignUpHostState extends State<SignUpHost> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  // File? _qrImageFile;

  @override
  Widget build(BuildContext context) {
    
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(gradient: AppConstantsWidgetStyle.kgradientScreen),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Themecolor.white,)),
          title: Text('Register Company', style: TextStyle(color: Themecolor.white)),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: height * 0.9,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Themecolor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthField(
                    controller: _usernameController,
                    hintText: 'Your CompanyName',
                    keyboardType: TextInputType.name,
                    isPasswordField: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  AuthField(
                    controller: _emailController,
                    hintText: 'Your Email',
                    keyboardType: TextInputType.emailAddress,
                    isPasswordField: false,
                    validator: (value) {
                      if (value == null || value.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  AuthField(
                    controller: _passwordController,
                    hintText: 'Your Password',
                    isPasswordField: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Consumer<SignupProvider>(
                    builder: (BuildContext context, provider, Widget? child) {
                      return PrimaryButton(
                        borderRadius: 10,
                        onTap: () async {
                          Utils.dismissKeyboard(context);
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            final username = _usernameController.text;
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            Map<String, dynamic> data = {
                              'companyName': username,
                              'email': email,
                              'password': password
                            };
                            await provider.companySignup(data, context);
                            
                             
                            setState(() {
                              _isLoading = false;
                            });
                           
                          }
                        },
                        text: 'Register',
                        isLoading: _isLoading,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already a member?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Themecolor.grey,
                          )),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, RoutesName.signin);
                        },
                        text: 'Sign In',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
// Future<void> _generateAndSaveQRCode(String data) async {
//   try {
//     final qrValidationResult = QrValidator.validate(
//       data: data,
//       version: QrVersions.auto,
//       errorCorrectionLevel: QrErrorCorrectLevel.L,
//     );
//     if (qrValidationResult.status == QrValidationStatus.valid) {
//       final qrCode = qrValidationResult.qrCode!;
//       final painter = QrPainter.withQr(
//         qr: qrCode,
//        color: Colors.black,
//           emptyColor: Colors.white,
//         gapless: true,
//       );
//       final tempDir = await getTemporaryDirectory();
//       final qrFile = File('${tempDir.path}/qr_code.png');
//       final image = await painter.toImage(300);
//       final byteData = await image.toByteData(format: ImageByteFormat.png);

//       // Debug prints
//       print('Saving QR code to ${qrFile.path}');
//       print('Byte data length: ${byteData!.buffer.asUint8List().length}');

//       await qrFile.writeAsBytes(byteData!.buffer.asUint8List());
//       setState(() {
//         _qrImageFile = qrFile;
//       });
//     } else {
//       print('QR Validation failed: ${qrValidationResult.status}');
//     }
//   } catch (e) {
//     print('Error generating QR code: $e');
//   }
// }

  

// void _showQRCodeDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('QR Code Generated'),
//       content: _qrImageFile != null
//           ? Container(
//               width: 300, // Adjust the width as needed
//               height: 300, // Adjust the height as needed
//               child: Image.file(
//                 _qrImageFile!,
//                 fit: BoxFit.cover, // Adjust fit property as needed
//               ),
//             )
//           : const Text('Failed to generate QR code.'),
//       actions: [
//         ElevatedButton(
//           onPressed: () {
//             if (_qrImageFile != null) {
//               Share.shareFiles([_qrImageFile!.path]);
//             }
//           },
//           child: const Text('Share QR Code'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Close'),
//         ),
//       ],
//     ),
//   );
// }

}



class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;

  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        text,
        style: TextStyle(color: color ?? Themecolor.orange, fontSize: fontSize ?? 14),
      ),
    );
  }
}



class PrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;
  final bool isLoading; // Added this line

  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.color,
    this.isLoading = false, // Default to false
    Key? key,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isLoading
          ? null // Disable tap when loading
          : () {
              _controller.forward().then((_) {
                _controller.reverse();
              });
              widget.onTap();
            },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            height: widget.height ?? 55,
            alignment: Alignment.center,
            width: widget.width ?? double.infinity,
            decoration: BoxDecoration(
              gradient: AppConstantsWidgetStyle.kgradientButton,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
            ),
            child: widget.isLoading
                ? SizedBox(
                    width: widget.width ?? double.infinity,
                    height: widget.height ?? 55,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  )
                : Text(
                    widget.text,
                    style: TextStyle(
                      color: widget.color ?? Colors.white,
                      fontSize: widget.fontSize ?? 15,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
class AuthField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final bool isPasswordField;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.isPasswordField = false,
    this.keyboardType,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPasswordField ? isObscure : false,
      validator: widget.validator,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorMaxLines: 2,
        filled: false,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Themecolor.black,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
      ),
    );
  }
}



