import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/screens/task_screen.dart';
import 'package:todoey_flutter/models/task_data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskData(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(),
    );
  }
}
