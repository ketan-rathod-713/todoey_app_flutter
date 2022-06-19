import 'package:flutter/foundation.dart';
import 'package:todoey_app_flutter/modals/task.dart';

class taskData extends ChangeNotifier{
  List<Task> tasks = [       // Now tasks is in parent so give it to add
    Task( name: 'Long press notes to delete'),
    Task( name: 'Buy milk'),
    Task( name: 'Buy banana'),
  ];

  void addTask(String taskTitle){
    tasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }

}