import 'package:flutter/cupertino.dart';
import 'package:todo_app/screen/add_todo.dart';
import 'package:todo_app/screen/home_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder>get routes =>{
    HomeScreen.name:(_)=>const HomeScreen(),
    AddTodo.name:(_)=>const AddTodo(),
  };
}