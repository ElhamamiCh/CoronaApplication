import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/core/colors.dart';
import 'package:project_iot/page/addM.dart';
import 'package:project_iot/page/editHistory.dart';


class MedicalHist extends StatefulWidget {
  MedicalHist({Key? key}) : super(key: key);

  @override
  _MedicalHistState createState() => _MedicalHistState();
}

class _MedicalHistState extends State<MedicalHist> {

  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("history").get();
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
        title: Text('Medical History'), // Change the title to 'Network'
      ),
      body: Column(
        children: [
          Expanded(
            child:UserNetworkList(data: data),
          ),
          // Add a circular and blue "Add" button on the right
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () {
                // Handle the "Add" button tap
                Navigator.pushNamed(context,
                    'addM',arguments:id );
                print('Add button tapped');
                // Add your logic for adding a new item or navigating to another screen
              },
              backgroundColor: blueButton, // Set button color to blue
              child: Icon(
                Icons.add,
                color: Colors.white, // Set text color to white
              ),
            ),
          ),
        ],
      ),
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
      var startDate = userData['startDate'] ?? ''; // Replace 'name' with the actual field name in your data
      var endDate = userData['endDate'] ?? ''; // Replace 'name' with the actual field name in your data
      var status = userData['status'] ?? ''; // Replace 'name' with the actual field name in your data

        return Padding(
          padding: EdgeInsets.all(5),
          child: Card(
            child: Container(
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 10.0), // Modify top padding,
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/image/coronavirus.png'),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(startDate),
                    Text(endDate),
                    Text(status),

                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Handle delete action
                         },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Handle edit action
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) =>EditHistory() ));
                           },
                    ),
                  ],
                ),
                onTap: () {

                },
              ),
            ),
          ),
        );
      },
    );
  }
}
