import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({super.key,required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,right: 18,left: 18),
      child: TextFormField(
        style: const TextStyle(
          color: Color(0xff4C4C4C),
        ),
        cursorColor: const Color(0xff4C4C4C),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          labelText: text,
          labelStyle: const TextStyle(
            color: Color(0xff4C4C4C),
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xff4C4C4C),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xff4C4C4C),
            ),
          ),
        ),
      ),
    );
  }
}
