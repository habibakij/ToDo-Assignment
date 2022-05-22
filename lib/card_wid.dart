import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/database.dart';
import 'package:todo/todomodel.dart';

class TodoCard extends StatelessWidget{
  final TodoModel todoModel;
  const TodoCard({Key? key, required this.todoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.white70,
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Row(
          children: [

            Expanded(
              child: Text(
                todoModel.title.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Checkbox(
              value: todoModel.done,
              onChanged: (newValue){
                Database().updateCheckBoxTodo(newValue!, todoModel.todoID.toString());
              },
            ),

          ],
        ),
      ),
    );
  }

}