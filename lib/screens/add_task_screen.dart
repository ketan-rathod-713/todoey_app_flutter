import 'package:flutter/material.dart';
import 'package:todoey_app_flutter/modals/task.dart';


class AddTaskScreen extends StatelessWidget {
  final List tasks;
  final Function restoreItems;
  const AddTaskScreen({Key? key,required this.tasks,required this.restoreItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String taskText="";
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add Task",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Colors.lightBlueAccent
          ),) ,
      SizedBox(height: 10,),
      TextField(
        onChanged: (val){
          print(val);
          taskText = val;
        },
        autofocus: true,
       textAlign: TextAlign.center,
      ),
          SizedBox(height: 20,),

          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
              ),
              onPressed: (){
            // add task in tasks
                if(taskText.isNotEmpty)
                tasks.add(Task(name: taskText));
                restoreItems();
                Navigator.pop(context);
                 },
              child: Text("Add",
              style: TextStyle(
                color: Colors.white
              ),
              )
          )
        ],
      ),
    );
  }
}
