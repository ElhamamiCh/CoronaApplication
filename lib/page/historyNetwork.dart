import 'package:flutter/material.dart';

class HistoryNetwork extends StatefulWidget {
  HistoryNetwork({Key? key}) : super(key: key);

  @override
  _HistoryNetworkState createState() => _HistoryNetworkState();
}

class _HistoryNetworkState extends State<HistoryNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical History'), // Change the title to 'Network'
      ),
      body: UserNetworkList(),
    );
  }
}

class UserNetworkList extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'history': 'History 1', 'startDate': '2022-01-01', 'endDate': '2022-02-01','status':'Diagnosed with coronavirus'},
    {'history': 'History 2', 'startDate': '2022-02-01', 'endDate': '2022-03-01','status':'Positive for COVID-19'},
    {'history': 'History 3', 'startDate': '2022-03-01', 'endDate': '2022-04-01','status':'Diagnosed with coronavirus'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
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
                    Text('Start Date: ${items[index]['startDate'] ?? ''}'),
                    Text('End Date: ${items[index]['endDate'] ?? ''}'),
                    Text('Status: ${items[index]['status'] ?? ''}'),
                  ],
                ),
                onTap: () {
                  print('Tapped on ${items[index]['history']}');
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
