import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(gradient: AppConstantsWidgetStyle.kgradientScreen),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Sign Up', style: TextStyle(color: Themecolor.white)),
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
                    hintText: 'Your Username',
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
                            final username = _usernameController.text;
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            Map<String, dynamic> data = {
                              'companyName': username,
                              'email': email,
                              'password': password
                            };
                            await provider.companySignup(data,context);
                          }
                        },
                        text: 'Sign Up',
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
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Themecolor.black),
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Themecolor.grey,
                ),
              )
            : null,
      ),
    );
  }
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

  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> with SingleTickerProviderStateMixin {
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
      onTap: () {
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
            child: Text(
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
