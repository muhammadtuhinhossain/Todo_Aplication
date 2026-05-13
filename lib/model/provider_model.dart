import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/model/task_model.dart';

class ProviderModel extends ChangeNotifier{
  List<TaskModel> _tasks=[];

  List<TaskModel> get tasks=> _tasks;

  ProviderModel(){
    loadTasks();
  }

  // Hive
  Future<void> loadTasks()async{
    final box= await Hive.openBox('todoBox');
    final data= box.get('tasks', defaultValue: []);

    _tasks = List<TaskModel>.from(
      (data as List).map((e) => TaskModel.fromJson(Map<dynamic, dynamic>.from(e))),
    );
    notifyListeners();
  }

  Future<void> saveTasks()async{
    final box= await Hive.openBox('todoBox');
    List<Map<String, dynamic>> data= _tasks.map((e)=>e.toJson()).toList();
    await box.put('tasks', data);
  }

  void addTask(TaskModel task){
    tasks.add(task);
    saveTasks();
    notifyListeners();
  }

  void checkTask(int index){
    tasks[index].isComplete();
    saveTasks();
    notifyListeners();
  }

  void removeTask(TaskModel task){
    tasks.remove(task);
    saveTasks();
    notifyListeners();
  }
}