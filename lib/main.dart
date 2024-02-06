import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> taskTitles = [
    'Understand Code',
    'Figure out duplication',
    'Refactor',
    'Add comments',
    'commit code',
    'push to github',
  ];

  List<bool> taskStates = [true, false, true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Your Tasks'),
      ),
      body: Container(
        color: Colors.teal,
        child: ListView.builder(
          itemCount: taskTitles.length,
          itemBuilder: (context, index) {
            return Task(
              title: taskTitles[index],
              checked: taskStates[index],
              onTaskChanged: (newValue) {
                setState(() {
                  taskStates[index] = newValue;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String title;
  final bool checked;
  final ValueChanged<bool> onTaskChanged;

  Task({Key key, this.title, this.checked, this.onTaskChanged})
      : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: widget.checked,
        onChanged: widget.onTaskChanged,
        activeColor: Colors.teal,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontStyle: widget.checked ? FontStyle.italic : FontStyle.normal,
            color: widget.checked ? Colors.grey : Colors.black,
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
