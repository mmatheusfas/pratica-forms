import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.icon, required this.label, required this.hintText}) : super(key: key);

  final IconData? icon;
  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text){
        if (text == null || text.isEmpty){
          return "This field can\'t be empty!";
        }
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon == null ? const Icon(Icons.surfing) : Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        )
      ),
    );
  }
}