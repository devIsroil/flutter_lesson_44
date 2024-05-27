import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  final TextEditingController indexController;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController positionController;
  final TextEditingController skillController;

  Edit({
    required this.indexController,
    required this.nameController,
    required this.ageController,
    required this.positionController,
    required this.skillController,
  });

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Employee')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: widget.indexController,
              decoration: InputDecoration(labelText: 'Index'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: widget.nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: widget.ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: widget.positionController,
              decoration: InputDecoration(labelText: 'Position'),
            ),
            TextField(
              controller: widget.skillController,
              decoration: InputDecoration(labelText: 'Skill'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
