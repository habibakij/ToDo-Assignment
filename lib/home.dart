import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {

  TextEditingController titleController= TextEditingController();
  TextEditingController descriptionController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: const Icon(Icons.add, color: Colors.transparent,),
        title: const Text(
          "Home",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),

      body: Container()

    );
  }




}
