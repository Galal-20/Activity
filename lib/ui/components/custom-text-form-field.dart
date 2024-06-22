import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  String labelText;
  TextInputType? keyboardType;
  bool isObSecure;
  Validator? validator;
  TextEditingController controller;
  int maxLine;

  CustomTextFormField({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text, // ?
    this.isObSecure = false,
    this.validator,
    required this.controller,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: isObSecure,
        validator: validator,
        controller: controller,
        maxLines: maxLine,
        minLines: maxLine,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.green, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.green, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red, width: 2)),
        ),
      ),
    );
  }
}
