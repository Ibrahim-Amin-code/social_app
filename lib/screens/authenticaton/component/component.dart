
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildTextField({
  // required double? double,
  String? hintText,
  String? labelText,
  required bool obscureText,
  required TextInputType? type,
  TextEditingController? controller,
  FormFieldValidator<String>? validator
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 30),
    child: TextFormField(
      validator: validator,
      obscureText: obscureText,
      style: TextStyle(
          color: Colors.white
      ),
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        labelText: labelText,
        labelStyle: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 14,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Cairo',
          fontSize: 14,
        ),
      ),
      // onTap: onTap,
      // onFieldSubmitted: onFieldSubmitted,
      // onChanged: onChanged,
      // onSaved: onSaved,
      keyboardType: type,
      // initialValue: initialValue,
    ),
  );
}

Widget defaultButton({
  required double width,
  double? height,
  Color? background,
  bool isUpperCase = true,
  double radius = 0,
  required VoidCallback function,
  required String text,
}) =>
    MaterialButton(
      minWidth: width,
      height: height,
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      onPressed: function,
      child: Text(text,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: "Cairo"
      ),),
    );
