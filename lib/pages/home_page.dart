import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utili/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of todo tasks:
  List<List<dynamic>> toDoList = [
    ["Study", false],
    ["Sleep", false],
  ];
  //checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState((){
      toDoList[index][1] = !toDoList[index][1];
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('TO DO'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDotile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
