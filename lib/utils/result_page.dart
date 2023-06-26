import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String diagnosis;

  ResultPage({required this.diagnosis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Diagnosis'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Anda didiagnosis menderita:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              diagnosis,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ulangi Diagnosis'),
            ),
          ],
        ),
      ),
    );
  }
}
