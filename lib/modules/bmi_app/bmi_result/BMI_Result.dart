
import 'package:flutter/material.dart';

class BMI_Result  extends StatelessWidget {
  final double result;
  final int age;
  final bool isMale;

  BMI_Result({


   required this.result,
   required this.age,
   required this.isMale,
 });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);

            },
            icon: Icon(
                Icons.keyboard_arrow_left

            )

        ),

        title: Text("BMI Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text( isMale ?"Gender : MALE    ":"Gender : FeMAIL    ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
            Text("Age : ${age}     ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
            Text("Result :  ${result.round()}    ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),

          ],
        ),
      ),
    );
  }
}
