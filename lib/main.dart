import 'package:flutter/material.dart';
import './task.dart';

void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<String> tasks = [];
  String text = "";

  @override
  Widget build(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      title: Text('Add Task'),
      content: TextField(
          onChanged: (value) {
            setState(() {
              text = value;
            });
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'enter the task')),
      actions: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                tasks.add(text);
              });
              Navigator.pop(context);
            },
            child: Text("Create task")),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("welcome, user!"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Dismissible(
              key: Key(task),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                color: Colors.grey[300],
                padding: EdgeInsets.all(20.0),
                child: Task(text: task),
              ),
              onDismissed: (direction) {
                setState(() {
                  tasks.removeAt(index);
                });
              },
              background: Container(
                  color: Colors.red,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  )),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext dialogContext) => dialog);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: tasks.map((task) {
//           return Dismissible(
//             key: Key(task),
//             child: Container(
//                 margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
//                 color: Colors.grey[300],
//                 padding: EdgeInsets.all(20.0),
//                 child: Task(text: task)),
//             onDismissed: (direction) {
//               int index = tasks.indexWhere((element) => element == text);
//               setState(() {
//                 tasks.removeAt(index);
//               });
//             },
//           );
//         }).toList(),
//       ),
