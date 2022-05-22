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

      body: _customBody(context),


    );
  }

  Widget _customBody(BuildContext context){
    return CustomScrollView(
      slivers: [

        SliverToBoxAdapter(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 15,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.red.withOpacity(.2), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Title $index",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      "Description $index",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.withOpacity(.8),
                      ),
                    ),

                  ],
                ),
              ),
            );
          },),
        ),

      ],
    );
  }


}
