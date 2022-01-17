import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stak extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: 350,
            height: 200,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: Colors.amber,
              // borderRadius: BorderRadius.circular(25),
              // //border: BorderRadius.circular(.5)
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(5),
                topStart: Radius.circular(
                  20.0,
                ),
              ),
            ),
            child: Image(
                fit: BoxFit.cover,
                height: 100,
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg')),
            //Image.asset("assets/images/sh.jpg")),
          ),
          SizedBox(
            height: 30,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                //margin: EdgeInsetsDirectional.all(20),
                //color: Colors.red,
                width: 300,
                child: Image(
                    fit: BoxFit.fill,
                    height: 300,
                    image: AssetImage("assets/images/flower.jpg")),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.5),
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(25),
                    bottomStart: Radius.circular(25),
                  ),
                ),

                width: 300,

                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Text(
                  'Flower',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
