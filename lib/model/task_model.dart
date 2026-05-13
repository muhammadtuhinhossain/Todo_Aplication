class TaskModel {
  final String title;
  bool isDone;

  TaskModel({required this.title, required this.isDone});

  void isComplete(){
    isDone = !isDone;
  }

  //Hive data get & set
  Map<String, dynamic> toJson(){
    return{
      'title':title,
      'isDone':isDone,
    };
  }

  factory TaskModel.fromJson(Map<dynamic, dynamic> json){
    return TaskModel(
        title: json['title'],
        isDone: json['isDone'],
    );
  }
}