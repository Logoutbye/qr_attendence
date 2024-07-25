  
  
  import 'package:flutter/material.dart';

Widget buildCustomTextField({
   TextEditingController? controller,
    void Function(String)? onChanged, 

   String? labelText,
 String? hintText,
  IconData? icon,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    onChanged:onChanged,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      icon: icon != null ? Icon(icon) : null,
      border: OutlineInputBorder(),
    ),
  );
}