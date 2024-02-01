import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/core/colors.dart';

class AddM extends StatefulWidget {
  @override
  _AddMState createState() => _AddMState();
}

class _AddMState extends State<AddM> {
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _statusController;

  CollectionReference users = FirebaseFirestore.instance.collection('history');

  Future<void> addHist(idAcc) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'startDate': _startDateController.text, // John Doe
      'endDate':_endDateController.text,
      'status':_statusController.text,
      'idAcc':idAcc,
    })
        .then((value) => print("History Added"))
        .catchError((error) => print("Failed to add history: $error"));
  }

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _statusController = TextEditingController();
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Object? id = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Medical History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Centered Image
            Center(
              child: Image.asset(
                'assets/image/coronavirus.png',
                height: 100.0, // Adjust the height of the image
              ),
            ),
            SizedBox(height: 16.0),
            // TextField for Start Date
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(
                labelText: 'Start Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0), // Reduce border radius
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // TextField for End Date
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(
                labelText: 'End Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0), // Reduce border radius
                ),
              ),
            ),
            SizedBox(height: 10.0),

           TextField(
              controller: _statusController,
              decoration: InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0), // Reduce border radius
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // ElevatedButton with increased height
            ElevatedButton(
              onPressed: () {
                // Handle button tap
                print('Button tapped');
                addHist(id);
                Navigator.pushNamed(context,
                    'history' );

              },
              style: ElevatedButton.styleFrom(
                primary: blueButton, // Set button color to blue
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // Adjust button border radius
                ),
                minimumSize: Size(double.infinity, 50.0), // Increase button height
              ),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}

