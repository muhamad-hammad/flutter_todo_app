import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference our box
  final _mybox = Hive.box("mybox");

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Watch a tutorial", false],
      ["workout", false],
    ];
  }

  // load the data from database
  void loadData() async {
    toDoList = await _mybox.get("TODOLIST") ?? [];
    if (toDoList.isEmpty) {
      createInitialData();
    }
  }

  // update the database
  void updateDataBase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
