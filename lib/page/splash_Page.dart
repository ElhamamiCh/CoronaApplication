import 'package:flutter/material.dart';
import 'package:project_iot/core/colors.dart';
import 'package:project_iot/core/space.dart';
import 'package:project_iot/core/text_style.dart';
import 'package:project_iot/data/demo.dart';
import 'package:project_iot/page/login_page.dart';
import 'package:project_iot/widget/main_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Container(
            height: height,
            color: blackBG,
            child: Image.asset(
              'assets/image/covid.jpg',
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Hello',
                        style: headlineX,
                      ),
                      TextSpan(
                        text: '.',
                        style: headlineDott,
                      ),
                    ]),
                  ),
                  SpaceVH(height: 20.0),
                  Text(
                    splashText,
                    textAlign: TextAlign.center,
                    style: headline22,
                  ),
                  Mainbutton(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => LoginPage()));
                    },
                    btnColor: blueButton,
                    text: 'Get Started',
                    txtColor: white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
