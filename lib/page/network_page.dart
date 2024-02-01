import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/core/colors.dart';
import 'package:project_iot/core/space.dart';
import 'package:project_iot/core/text_style.dart';
import 'package:project_iot/data/demo.dart';
import 'package:project_iot/page/historyNetwork.dart';
import 'package:project_iot/page/login_page.dart';
import 'package:project_iot/widget/main_button.dart';

class Network extends StatefulWidget {
  Network({Key? key}) : super(key: key);

  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").get();
    setState(() {
      data.addAll(querySnapshot.docs);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Object? id = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Network'),
      ),
      body: UserNetworkList(data: data),
    );
  }
}

class UserNetworkList extends StatelessWidget {
  final List<QueryDocumentSnapshot> data;

  UserNetworkList({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        var userData = data[index].data() as Map<String, dynamic>;
        var userName = userData['full_name'] ?? '';

        return Padding(
          padding: EdgeInsets.all(5.0),
          child: Card(
            child: Container(
              height: 80.0,
              child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/image/corona.png'),
                ),
                title: Text(userName),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => HistoryNetwork()));
                  print('Tapped on $userName');
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
