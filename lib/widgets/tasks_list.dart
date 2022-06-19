import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app_flutter/modals/task_data.dart';
import 'package:todoey_app_flutter/widgets/task_tile.dart';
import '../modals/task.dart';

class TasksList extends StatelessWidget { // to update its state

  // final bool isChecked;
  // final List tasks;
  final Function checkboxCallback;

  const TasksList({Key? key,required this.checkboxCallback}) : super(key: key);  // List<Task> tasks = [
  //   Task( name: 'Just'),
  //   Task( name: 'Buy milk'),
  //   Task( name: 'Buy banana'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Consumer<taskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context,index){
            return ListTile(
              onLongPress:(){
                print("just");
                taskdata.deleteTask(taskdata.tasks[index]);
              },
              title: Text(taskdata.tasks[index].name, style: TextStyle(decoration: taskdata.tasks[index].isDone ? TextDecoration.lineThrough : null ),),
              trailing: Checkbox(
                  value: taskdata.tasks[index].isDone,
                  onChanged: (newValue){
                    print("I wasn't able to do it using that of angela ???");
                    checkboxCallback(index);
                  }
              ),
            );
            // return TaskTile(
            //     isChecked: tasks[index].isDone,
            //     taskTitle: tasks[index].name,
            //     // checkboxCallback: (checkboxState){
            //     //    setState(() {
            //     //      tasks[index].toggleDone();
            //     //    });
            //     // },
            // );
          },
          itemCount: taskdata.tasks.length,// if not set then range error
        );
      });
}
}

