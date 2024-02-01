import 'package:flutter/material.dart';
import 'package:project_iot/core/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String hinttext;
  final TextEditingController mycontroller;

  const CustomTextForm({super.key, required this.hinttext, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0), // Apply a reduced border
      ),
      child: TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          filled: true,
          fillColor: blackTextFild,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none, // Remove the border
          ),
        ),
      ),
    );
  }
}