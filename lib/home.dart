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

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          todoDialog(context, titleController, descriptionController);
        },
        child: const Icon(Icons.add),
      ),

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

  void todoDialog(BuildContext context, TextEditingController title, TextEditingController description) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DelayedDisplay(
          delay: const Duration(milliseconds: 300),
          child: CupertinoAlertDialog(
            content: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: 200,
                  width: 250,
                  margin: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// title text
                      const SizedBox(
                        height: 30,
                        child: Text(
                          "List your ToDo",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.red.withOpacity(.5)),
                          color: Colors.grey.withOpacity(.1),
                        ),
                        child: TextFormField(
                          controller: title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusColor: Colors.black,
                            hintText: 'Title',
                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                          ),

                        ),
                      ),

                      Container(
                        //height: 40,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.red.withOpacity(.5)),
                          color: Colors.grey.withOpacity(.1),
                        ),
                        child: TextFormField(
                          controller: description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusColor: Colors.black,
                            hintText: 'Description',
                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: HexColor("#00AFDE"),
                            ),
                            child: FlatButton(
                              minWidth: MediaQuery.of(context).size.width,
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),

                          Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: HexColor("#00AFDE"),
                            ),
                            child: FlatButton(
                              minWidth: MediaQuery.of(context).size.width,
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {

                              },
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
