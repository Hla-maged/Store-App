import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  String? hint;
  bool? obsecure;
  TextInputType? InputType;
  CustomTextFeild({this.onChanged, required this.hint, this.obsecure = false,this.InputType});
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecure!,
      onChanged: onChanged,
      keyboardType: InputType,
      decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(16))),
    );
  }
}
