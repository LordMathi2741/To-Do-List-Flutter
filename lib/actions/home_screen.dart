
import 'package:flutter/material.dart';
import 'package:todolist/theme/app_theme.dart';
import 'package:todolist/widgets/task_manager.dart';

class HomeScreen extends StatelessWidget{
   HomeScreen({super.key});
  final GlobalKey<TaskManagerState> _taskManagerKey = GlobalKey<TaskManagerState>();
   final TextEditingController _taskController = TextEditingController();

  void displayDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return  AlertDialog(
            elevation: 5,
            title: const Center(child: Text("Do you want to add new task?")),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [ 
                TextField(
                  controller: _taskController,
                  decoration: const InputDecoration(
                    hintText: "Send your task",
                    labelText: "Task",
                    suffixIcon: Icon(Icons.task_alt)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Row(
                     children: [
                        TextButton(
                            onPressed: (){
                              final task = _taskController.text;
                              if(task.isNotEmpty) _taskManagerKey.currentState?.addTask(task);
                              _taskController.clear();
                              Navigator.of(context).pop();
                            },
                            child: const Text("Add")
                        ),
                        const SizedBox(width: 100,),
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                               foregroundColor: AppTheme.error
                            ),
                            child: const Text("Cancel")
                        )
                     ],
                  )
              ),
             ]
            )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text("ToDoList")),
       body:  SingleChildScrollView(
         child: Column(
           children:[
             const SizedBox(height: 100,),
             TaskManager(key: _taskManagerKey,)
           ]
         )
       ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () { displayDialog(context); },
        child: const Icon(Icons.add)
      ),
    );
  }

}