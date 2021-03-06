import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  String? newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF757575),
          width: 0,
        ),
        color: Color(0xFF757575),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              SizedBox(
                height: 25.0,
              ),
              TextButton(
                child: Text('Add'),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.all(16.0),
                  primary: Theme.of(context).accentColor,
                  textStyle: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Provider.of<TaskData>(
                    context,
                    listen: false,
                  ).addTask(newTaskTitle!);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
