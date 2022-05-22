import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo/todomodel.dart';

class Database{
    CollectionReference reference= FirebaseFirestore.instance.collection("todoAssignmentTask");

  void addToDo(String title){
    EasyLoading.show(status: "Please Wait...");
    reference.add({"title": title, "done": false});
    EasyLoading.dismiss();
  }

  Stream<List<TodoModel>> todoStream(){
    return reference.snapshots()
    .map((QuerySnapshot query){
      List<TodoModel> retAllData= [];
      query.docs.forEach((element) {
        retAllData.add(TodoModel.fromDocumentSnapshot(element));
      });
    });
  }

}