import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/core/colors.dart';
import 'package:project_iot/core/space.dart';
import 'package:project_iot/core/text_style.dart';
import 'package:project_iot/page/sign_up.dart';
import 'package:project_iot/page/home_page.dart';
import 'package:project_iot/widget/main_button.dart';
import 'package:project_iot/widget/text_field_password.dart';
import 'package:project_iot/widget/text_fild.dart';
import 'package:project_iot/widget/textformfield.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                'Welcome Back!',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Please sign in to your account',
                style: headline3,
              ),
              SpaceVH(height: 60.0),

              CustomTextForm(
                  hinttext: "Email", mycontroller: email),

              CustomTextFormPassword(
                  hinttext: "Password", mycontroller: password),

              SpaceVH(height: 5.0),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: ()  {
                    },
                    child: Text(
                      'Forgot Password?',
                      style: headline3,
                    ),
                  ),
                ),
              ),
              SpaceVH(height: 30.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                      onTap: () async {
                        try {
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: email.text,
                              password: password.text
                          );
                          final String uid = credential.user?.uid ?? '';
                          Navigator.pushNamed(context,
                              'home', arguments:uid);

                        } on FirebaseAuthException catch (e) {
                          if (e.code == '=========== user-not-found ===========') {
                            print('========== No user found for that email. ==========');
                          } else if (e.code == '=========== wrong-password ===========') {
                            print('======== Wrong password provided for that user. ========');
                          }
                        }
                         },
                      text: 'Sign in',
                      txtColor: white,
                      btnColor: blueButton,

                    ),
                    SpaceVH(height: 20.0),
                    Mainbutton(
                      onTap: () {},
                      text: 'Sign in with google',
                      image: 'google.png',
                      btnColor: whiteG,
                      txtColor: gray,
                    ),
                    SpaceVH(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => SignUpPage()));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Don\' have an account? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' Sign Up',
                            style: headlineDot.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
