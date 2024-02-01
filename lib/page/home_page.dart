import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/core/colors.dart';
import 'package:project_iot/core/space.dart';
import 'package:project_iot/core/text_style.dart';
import 'package:project_iot/page/alerts_page.dart';
import 'package:project_iot/page/login_page.dart';
import 'package:project_iot/page/medical_hist_page.dart';
import 'package:project_iot/page/network_page.dart';
import 'package:project_iot/page/sign_up.dart';
import 'package:project_iot/page/home_page.dart';
import 'package:project_iot/widget/buttonHome.dart';
import 'package:project_iot/widget/main_button.dart';



class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final Object? id = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      backgroundColor: blackBG,
      appBar: AppBar(
        title: Text('Home',style: headline1),
          actions:[
            IconButton(onPressed :() async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) =>LoginPage() ));
            },icon:Icon(Icons.exit_to_app))
          ]
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(height: 50.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    HomeButton(
                      onTap: () {
                        Navigator.pushNamed(context,
                            'alerts',arguments: id );},
                      text: 'Alerts',
                      txtColor: white,
                      btnColor: blueButton,
                    ),
                    SpaceVH(height: 20.0),
                    HomeButton(
                      onTap: () {
                        Navigator.pushNamed(context,
                            'network',arguments: id );
                      },
                      text: 'Network',
                      txtColor: white,
                      btnColor: blueButton,

                    ),
                    SpaceVH(height: 20.0),
                    HomeButton(
                      onTap: () {
                        Navigator.pushNamed(context,
                            'history',arguments: id );
                      },
                      text: 'Medical History',
                      txtColor: white,
                      btnColor: blueButton,

                    ),
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
