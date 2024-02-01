import 'package:flutter/material.dart';
import 'package:project_iot/core/colors.dart';

class CustomTextFormPassword extends StatefulWidget {
  final String hinttext;
  final TextEditingController mycontroller;

  const CustomTextFormPassword({super.key, required this.hinttext, required this.mycontroller});

  @override
  State<CustomTextFormPassword> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextFormPassword> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextFormField(
        controller: widget.mycontroller,
        obscureText: !_passwordVisible, // Hide the password
        decoration: InputDecoration(
          hintText: widget.hinttext,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          filled: true,
          fillColor: blackTextFild,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
