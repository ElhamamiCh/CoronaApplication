import 'package:flutter/material.dart';
import 'package:project_iot/page/historyNetwork.dart';

class CoronaNotificationsPage extends StatefulWidget {
  @override
  _CoronaNotificationsPageState createState() => _CoronaNotificationsPageState();
}

class _CoronaNotificationsPageState extends State<CoronaNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    final Object? id = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Corona Notifications'),
      ),
      body: ListView.builder(
        itemCount: coronaPeople.length,
        itemBuilder: (context, index) {

          return ListTile(
            leading: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/image/sick.png'), // Replace with your image asset path
            ),
            title: Text(coronaPeople[index]['name'] ?? ''),
            subtitle: Text(coronaPeople[index]['status'] ?? ''),
            onTap: () {
              // Handle item tap
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) =>HistoryNetwork() ));
              print('Tapped on ${coronaPeople[index]['name']}');
            },
          );
        },
      ),
    );
  }
}

List<Map<String, String>> coronaPeople = [
  {'name': 'Sara', 'status': 'Diagnosed with coronavirus'},
  {'name': 'Youssef', 'status': 'Positive for COVID-19'},
  {'name': 'Farah', 'status': 'In isolation due to coronavirus infection'},
  // Add more people as needed
];

