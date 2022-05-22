import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo/database.dart';
import 'package:todo/todomodel.dart';

class TodoController extends GetxController{
  RxList<TodoModel> todoLists= RxList<TodoModel>();
  List<TodoModel> get todos => todoLists;

  @override
  void onInit() {
    super.onInit();
    todoLists.bindStream(Database().todoStream());
  }

}