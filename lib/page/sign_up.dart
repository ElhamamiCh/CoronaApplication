import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/core/colors.dart';
import 'package:project_iot/core/space.dart';
import 'package:project_iot/core/text_style.dart';
import 'package:project_iot/page/home_page.dart';
import 'package:project_iot/widget/main_button.dart';
import 'package:project_iot/widget/textformfield.dart';
import 'package:project_iot/widget/text_field_password.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
 final TextEditingController userName = TextEditingController();
 final TextEditingController password = TextEditingController();
 final TextEditingController email = TextEditingController();
 CollectionReference users = FirebaseFirestore.instance.collection('users');


 Future<String> addUser(String uid) async {
   try {

     DocumentReference userRef = await users.add({
       'full_name': userName.text,
       'email': email.text,
       'uid': uid,
     });

     print("=============User Added with ID: ${userRef.id}============");
     return userRef.id;
   } catch (error) {
     print("Failed to add user: $error");
     return '';
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(height: 50.0),
              Text(
                'Create new account',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Please fill in the form to continue',
                style: headline3,
              ),
              SpaceVH(height: 60.0),
              CustomTextForm(
                  hinttext: "Full Name", mycontroller: userName),
              CustomTextForm(
                  hinttext: "ُEmail", mycontroller: email),
              CustomTextFormPassword(
                  hinttext: "Password", mycontroller: password),
              SpaceVH(height: 50.0),
              Mainbutton(
                onTap: () async {
                  try {
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    if (email.text.isEmpty || password.text.isEmpty) {
                      // Handle empty or null values
                      print('=============Email or password is empty!=============');
                      return;
                    }
                    final String uid = credential.user?.uid ?? '';
                    addUser(uid);
                    Navigator.pushNamed(
                      context,
                      'home',
                      arguments: uid,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == '=============weak-password=============') {
                      print('=============The password provided is too weak=============');
                    } else if (e.code == '=============email-already-in-use============') {
                      print('=============The account already exists for that email=============');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                text: 'Sign Up',
                txtColor: white,
                btnColor: blueButton,
              ),
              SpaceVH(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Have an account? ',
                      style: headline.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: ' Sign In',
                      style: headlineDot.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
