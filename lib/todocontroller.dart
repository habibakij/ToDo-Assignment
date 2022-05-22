import 'package:get/get.dart';
import 'package:todo/database.dart';
import 'package:todo/todomodel.dart';

class TodoController extends GetxController{
  Rx<List<TodoModel>> todoLists= Rx<List<TodoModel>>();
  List<TodoModel> get todos => todoLists.value;

  @override
  void onInit() {
    super.onInit();
    todoLists.bindStream(Database().todoStream());
  }

}