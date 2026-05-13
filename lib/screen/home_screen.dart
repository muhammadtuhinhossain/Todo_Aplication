import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/provider_model.dart';
import 'package:todo_app/screen/add_todo.dart';

class HomeScreen extends StatelessWidget {
  static const name="/home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO App'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade800,
      ),
      body: Consumer<ProviderModel>(
        builder: (context, task, child) {
          return ListView.builder(
            itemCount: task.tasks.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(task.tasks[index].title,style: TextStyle(
                    decoration: task.tasks[index].isDone ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationThickness: 2,
                    color: task.tasks[index].isDone ? Colors.grey[500] : Colors.white,
                  ),),
                  trailing: Wrap(
                    children: [
                      Checkbox(value: task.tasks[index].isDone, onChanged: (_){
                        context.read<ProviderModel>().checkTask(index);
                      },),
                      
                      IconButton(onPressed: (){
                        context.read<ProviderModel>().removeTask(task.tasks[index]);
                      }, icon: Icon(Icons.delete,color: Colors.red.shade300,))
                    ],
                  )
                );
              });
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, AddTodo.name);
      },child: Icon(Icons.add),),
    );
  }
}
