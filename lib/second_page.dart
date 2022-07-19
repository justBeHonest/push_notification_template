// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String? payload;
  const SecondPage({Key? key, this.payload}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.payload ?? '',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Text(
              'PAYLOAD',
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
