import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:todo/common.dart';
import 'package:todo/database.dart';
import 'package:todo/todocontroller.dart';
import 'package:todo/todomodel.dart';

class TodoDetails extends StatelessWidget {
  final TodoModel todoModel;
  int index;
  TodoDetails({Key? key, required this.todoModel, required this.index}) : super(key: key);

  TextEditingController titleController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Todo Details",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),

      body: _customBody(context),

    );
  }

  Widget _customBody(BuildContext context){
    return CustomScrollView(
      slivers: [

        SliverToBoxAdapter(
          child: GetX<TodoController>(
            init: Get.put(TodoController()),
            builder: (TodoController todoController){
              return Container(
                height: 50,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.red.withOpacity(.5)),
                  color: Colors.grey.withOpacity(.1),
                ),
                child: Text(
                  todoController.todos[index].title.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
        ),


        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.red.withOpacity(.5)),
              color: Colors.grey.withOpacity(.1),
            ),
            child: TextFormField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusColor: Colors.black,
                hintText: 'Type somethings',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
              ),

            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              Container(
                height: 50,
                width: 120,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor("#00AFDE"),
                ),
                child: FlatButton(
                  minWidth: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if(titleController.text.toString().isEmpty){
                      Common.customToast("Enter update text");
                    } else {
                      Database().updateItem(titleController.text, todoModel.todoID.toString());
                      titleController.text = "";
                    }
                  },
                ),
              ),

            ]
          ),
        ),


      ],
    );
  }

}
