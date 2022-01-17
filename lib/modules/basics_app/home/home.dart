import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(toString()),
        actions: [
          Icon(Icons.add_ic_call),
          //Icon(Icons.menu_book_sharp),
          IconButton(
              onPressed: () {
                print("jooo");
              },
              icon: Icon(Icons.notification_add)),
          //printJO is anonimous method so cold withot ()
          //IconButton(onPressed: printJo, icon: Text("gggg"))
        ],
      ),
      body: Container(
        color: Colors.deepOrangeAccent,
        //width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // textDirection: TextDirection.ltr ,
            //mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1daggggggggggggta",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.red),
                //   //textAlign: TextAlignVertical.bottom,
                //   maxLines: 20,
                //
              ),
              SizedBox(
                height: 90,
              ),
              Text(
                "1data",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.amber),
              ),
              Text(
                "11data",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.amber),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "1111111data",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.deepOrange),
              )
            ],
          ),
        ),
      ),
    );
  }
}
