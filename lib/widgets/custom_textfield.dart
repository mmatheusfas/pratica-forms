import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.icon,
    required this.label,
    this.hintText,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  IconData? icon;
  final String label;
  String? hintText;
  void Function(String? text)? onSaved;
  String? Function (String? text)? validator;
  void Function(String? text)? onChanged;
  bool obscureText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscureText,
      onSaved: onSaved,
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon == null ? const Icon(Icons.surfing) : Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
    );
  }
}
