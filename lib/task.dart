import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String text;

  Task({Key key, @required this.text}) : super(key: key);

  @override
  TaskState createState() => TaskState();
}

class TaskState extends State<Task> {
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return (Row(
      children: [
        Checkbox(
          value: checkValue,
          onChanged: (bool value) {
            setState(() {
              checkValue = value;
            });
          },
        ),
        Text(widget.text),
      ],
    ));
  }
}
