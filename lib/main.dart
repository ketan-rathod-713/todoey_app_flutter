import 'package:flutter/material.dart';
import 'package:todoey_app_flutter/modals/task_data.dart';
import 'screens/tasks_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<taskData>(
      create: (context)=>taskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}
