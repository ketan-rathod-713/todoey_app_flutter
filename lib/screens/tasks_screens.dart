import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app_flutter/modals/task_data.dart';
import 'package:todoey_app_flutter/widgets/tasks_list.dart';
import '../modals/task.dart';
import 'add_task_screen.dart';


class TaskScreen extends StatefulWidget {

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // List<Task> tasks = [       // Now tasks is in parent so give it to add
  //   Task( name: 'Just'),
  //   Task( name: 'Buy milk'),
  //   Task( name: 'Buy banana'),
  // ];
  @override
  Widget build(BuildContext context) {
    return Consumer<taskData>(
      builder: (context, taskdata, child){
        return Scaffold(
          backgroundColor: Colors.lightBlueAccent,

          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: (){
              // slide up to get input a new task , Container ______ add
              showModalBottomSheet(context: context,
                builder: (BuildContext context)=> AddTaskScreen(tasks: taskdata.tasks,
                  restoreItems: (){
                    setState(() {

                    });

                  },),
                isScrollControlled: false,
                backgroundColor: Color.fromRGBO(117, 117, 117, 1),
              );
              //  just like buid method here
            },
            child: Icon(
              Icons.add,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 60,left: 30,right: 30,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.list,
                        size: 35,
                        color: Colors.lightBlueAccent,
                      ),
                    ) ,
                    SizedBox(height: 10,),
                    Text(
                      "Todoey",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      "${taskdata.tasks.length} Tasks",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    ),
                    child: TasksList(
                      checkboxCallback: (checkboxState){
                        setState(() {
                          taskdata.tasks[checkboxState].toggleDone();
                        });
                      },)
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}


