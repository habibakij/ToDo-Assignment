
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo/todomodel.dart';

class Database{
    CollectionReference reference= FirebaseFirestore.instance.collection("todoAssignmentTask");
  void addToDo(String title){
    EasyLoading.show(status: "Please Wait...");
    reference.add({
      "title": title,
      "done": false});
    EasyLoading.dismiss();
  }

  Stream<List<TodoModel>> todoStream(){
    return reference.orderBy("title", descending: false)
        .snapshots()
        .map((QuerySnapshot query){
          List<TodoModel> retAllData= [];
          query.docs.forEach((element) {
            retAllData.add(TodoModel.fromDocumentSnapshot(element));
          });
          return retAllData;
        });
  }

  Future<void> updateCheckBoxTodo(bool newValue, String todoID) async{
    try{
      reference.doc(todoID).update({"done":newValue});
    } catch(_){
      log(_.toString());
    }
  }

  Future<void> updateItem(String title, String todoID) async{
    try{
      reference.doc(todoID).update({"title":title});
    } catch(_){
      log(_.toString());
    }
  }

}