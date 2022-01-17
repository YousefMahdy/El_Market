import 'dart:math';


import 'package:flutter/material.dart';

import '../bmi_result/BMI_Result.dart';

class BMI_Calculator extends StatefulWidget {
  @override
  BMI_CalculatorState createState() => BMI_CalculatorState();
}

class BMI_CalculatorState extends State<BMI_Calculator> {

  double height =120.0;
  bool isMale =true;
  int age=20;
  int weight=50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        //titleSpacing: 20,
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      isMale=true;
                      setState(() {
                        print(isMale);

                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.ac_unit,
                            size: 70,
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: !isMale ? Colors.grey[300] : Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(

                    onTap: (){
                      isMale=false;
                      setState(() {
                        print(isMale);

                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: !isMale ?  Colors.blue : Colors.grey[300],),
    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.ac_unit,
                            size: 70,
                          ),
                          Text(
                            "FEMAL",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              //padding: const EdgeInsets.symmetric(horizontal: 20.0),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${height.round()}",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    onChanged: (value) {
                      height=value;
                      setState(() {

                      });
                     /// print(value.round());
                    },
                    max: 220,
                    min: 80,
                  )
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[300]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${weight}",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  weight--;
                                  setState(() {

                                  });
                                },
                                heroTag: "weight--",
                                child: Icon(
                                  Icons.remove,
                                ),
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  weight++;
                                  setState(() {

                                  });
                                },
                                heroTag: "weight++",
                                child: Icon(
                                  Icons.add,
                                ),
                                mini: true,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[300]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${age}",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  age--;
                                  setState(() {

                                  });
                                },
                                heroTag: "age--",
                                child: Icon(
                                  Icons.remove,
                                ),
                                mini: true,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  age++;
                                  setState(() {

                                  });
                                },
                                heroTag: "age++",
                                child: Icon(
                                  Icons.add,
                                ),
                                mini: true,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.blue),
            margin: EdgeInsetsDirectional.only(
              bottom: 10,
              end: 10,
              start: 10,
            ),
            width: double.infinity,

            child: MaterialButton(
              onPressed: () {
                double result = weight/(pow(height/ 100,2));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder:( context){
                        return BMI_Result(age: age,result: result,isMale: isMale,);
                      })
              );
              },

              child: Text(
                "CALCULATE",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              //  color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
