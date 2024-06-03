import 'package:flutter/material.dart';

class UserInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final bool obscureText;
  final String? Function(String? value)? validator;
  final IconData? icon;
  final TextInputType textInputType;
  const UserInputField({
    this.controller,
    required this.hint,
    this.obscureText = false,
    this.validator,
    this.icon,
    this.textInputType = TextInputType.name,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      validator: validator,
      decoration: InputDecoration(
        icon: Icon(icon),
        iconColor: Color.fromARGB(255, 156, 156, 159),
        hintText: hint,
        fillColor: Colors.grey.shade200,
        filled: true,
        hintFadeDuration: Duration(milliseconds: 500),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
