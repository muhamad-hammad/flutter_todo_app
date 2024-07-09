import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utili/dialog_box.dart';
import 'package:flutter_todo_app/utili/todo_tile.dart';
import 'package:flutter_todo_app/utili/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();

  // list of todo tasks:
  List<List<dynamic>> toDoList = [
    ["Study", false],
    ["Sleep", false],
  ];
  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //create a new task:
  void createNewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
        );
      },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            toDoList.add(["", false]);
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.grey[700],
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
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
