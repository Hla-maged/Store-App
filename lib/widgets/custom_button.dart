import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text;
  CustomButton({this.onTap, this.text});
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //padding: EdgeInsets.only(left: 140),
        child: Center(
          child: Text(
            'Update',
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
        height: 40,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
