import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {

  String? todoID;
  String? title;
  bool? done;

  TodoModel({this.todoID, this.title, this.done});

  TodoModel.fromDocumentSnapshot(DocumentSnapshot snapshot){
      todoID= snapshot.id;
      title= snapshot["title"].toString();
      done= snapshot["done"];
  }

}