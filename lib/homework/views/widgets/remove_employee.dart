import 'package:flutter/material.dart';

class Remove extends StatefulWidget {
  final TextEditingController indexController;

  Remove({required this.indexController});

  @override
  _RemoveState createState() => _RemoveState();
}

class _RemoveState extends State<Remove> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Remove Employee')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: widget.indexController,
              decoration: InputDecoration(labelText: 'Index'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Remove'),
            ),
          ],
        ),
      ),
    );
  }
}
