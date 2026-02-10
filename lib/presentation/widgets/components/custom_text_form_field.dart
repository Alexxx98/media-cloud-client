import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField {
  final TextEditingController textController;
  final String? hintText;

  CustomTextFormField({
    required this.textController,
    super.obscureText,
    this.hintText,
    super.key,
  }) : super(
         controller: textController,
         textAlign: TextAlign.center,
         cursorColor: Colors.grey.shade600,
         style: TextStyle(color: Colors.grey.shade300),
         decoration: InputDecoration(
           hintText: hintText,
           filled: true,
           fillColor: Colors.black,
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15),
             borderSide: BorderSide.none,
           ),
         ),
       );
}
