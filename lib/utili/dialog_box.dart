import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utili/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  const DialogBox({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: Container(
          height: 120,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //get user input
                TextField(
                  controller:controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter a task',
                    border: OutlineInputBorder(),
                  ),
                ),
                //buttons => save + cancel
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  //save button
                  MyButton(text: "Save", onPressed: () {}),
                  const Spacer(),
                  // cancel button
                  MyButton(text: "Cancel", onPressed: () {}),
                ]),
              ])),
    );
  }
}