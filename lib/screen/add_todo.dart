import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/provider_model.dart';
import 'package:todo_app/model/task_model.dart';

class AddTodo extends StatefulWidget {
  static const name="/add_todo";
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

  final todoTEController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    todoTEController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
          children: [
            SizedBox(height: 40,),
            TextField(
              controller: todoTEController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Enter Todo',
              ),
            ),
            SizedBox(height: 15,),
            Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  context.read<ProviderModel>().addTask(TaskModel(title: todoTEController.text, isDone: false));
                  todoTEController.clear();
                  Navigator.of(context).pop();
                }, child: Text('Add'))),
          ],
                ),
        ),
      ),
    );
  }
}
