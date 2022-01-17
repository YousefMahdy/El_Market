import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: Row(children: [
          CircleAvatar(
            backgroundColor: Colors.amber,
            backgroundImage: AssetImage('assets/images/flower.jpg'),
            radius: 20,
          ),
          SizedBox(width: 15),
          Text("Chats",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold
                  //  fontSize: 25

                  )),
        ]),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue[300],
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue[300],
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
           Column(
            children: [
              Container(
                  // width: 100,
                  // height: 100,
                  //clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 20,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text("Search"),
                      ),
                      Container(
                        padding:
                            const EdgeInsetsDirectional.only(bottom: 0, top: 0),
                        height: 28,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "UNREAD",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            )),
                      ),
                    ],
                  )),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      child: Column(children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/flower.jpg'),
                              radius: 30,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 3, end: 3),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 7,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 5, end: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.lightGreenAccent,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Yousef mahdy ",
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 60,
                      child: Column(children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/flower.jpg'),
                              radius: 30,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 3, end: 3),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 7,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 5, end: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.lightGreenAccent,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Yousef mahdy ",
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 60,
                      child: Column(children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/flower.jpg'),
                              radius: 30,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 3, end: 3),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 7,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 5, end: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.lightGreenAccent,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Yousef mahdy ",
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 60,
                      child: Column(children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/flower.jpg'),
                              radius: 30,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 3, end: 3),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 7,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 5, end: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.lightGreenAccent,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Yousef mahdy ",
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 60,
                      child: Column(children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/flower.jpg'),
                              radius: 30,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 3, end: 3),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 7,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 5, end: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.lightGreenAccent,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Yousef mahdy ",
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 60,
                      child: Column(children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/flower.jpg'),
                              radius: 30,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 3, end: 3),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 7,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  bottom: 5, end: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.lightGreenAccent,
                                // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                radius: 5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Yousef mahdy ",
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: Column(children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/images/flower.jpg'),
                                    radius: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 3, end: 3),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 7,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 5, end: 5),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.lightGreenAccent,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "YosefMahdy Shehata Saad",
                                  style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Hello My name is Yousef Mahdy Shehata Saad Yousef Mahdy Shehata Saad",
                                        style:
                                        TextStyle(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreenAccent,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("02:45 pm")
                                  ],
                                ),
                              ],
                            ),
                          ),SizedBox(height: 15,),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: Column(children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/images/flower.jpg'),
                                    radius: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 3, end: 3),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 7,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 5, end: 5),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.lightGreenAccent,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "YosefMahdy Shehata Saad",
                                  style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Hello My name is Yousef Mahdy Shehata Saad Yousef Mahdy Shehata Saad",
                                        style:
                                        TextStyle(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreenAccent,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("02:45 pm")
                                  ],
                                ),
                              ],
                            ),
                          ),SizedBox(height: 15,),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: Column(children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/images/flower.jpg'),
                                    radius: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 3, end: 3),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 7,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 5, end: 5),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.lightGreenAccent,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "YosefMahdy Shehata Saad",
                                  style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Hello My name is Yousef Mahdy Shehata Saad Yousef Mahdy Shehata Saad",
                                        style:
                                        TextStyle(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreenAccent,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("02:45 pm")
                                  ],
                                ),
                              ],
                            ),
                          ),SizedBox(height: 15,),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: Column(children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/images/flower.jpg'),
                                    radius: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 3, end: 3),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 7,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 5, end: 5),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.lightGreenAccent,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "YosefMahdy Shehata Saad",
                                  style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Hello My name is Yousef Mahdy Shehata Saad Yousef Mahdy Shehata Saad",
                                        style:
                                        TextStyle(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreenAccent,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("02:45 pm")
                                  ],
                                ),
                              ],
                            ),
                          ),SizedBox(height: 15,),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: Column(children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/images/flower.jpg'),
                                    radius: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 3, end: 3),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 7,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 5, end: 5),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.lightGreenAccent,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "YosefMahdy Shehata Saad",
                                  style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Hello My name is Yousef Mahdy Shehata Saad Yousef Mahdy Shehata Saad",
                                        style:
                                        TextStyle(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreenAccent,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("02:45 pm")
                                  ],
                                ),
                              ],
                            ),
                          ),SizedBox(height: 15,),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: Column(children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/images/flower.jpg'),
                                    radius: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 3, end: 3),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 7,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 5, end: 5),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.lightGreenAccent,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "YosefMahdy Shehata Saad",
                                  style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Hello My name is Yousef Mahdy Shehata Saad Yousef Mahdy Shehata Saad",
                                        style:
                                        TextStyle(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreenAccent,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("02:45 pm")
                                  ],
                                ),
                              ],
                            ),
                          ),SizedBox(height: 15,),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: Column(children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/images/flower.jpg'),
                                    radius: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 3, end: 3),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 7,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        bottom: 5, end: 5),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.lightGreenAccent,
                                      // backgroundImage: AssetImage('assets/images/flower.jpg'),
                                      radius: 5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "YosefMahdy Shehata Saad",
                                  style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5,),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Hello My name is Yousef Mahdy Shehata Saad Yousef Mahdy Shehata Saad",
                                        style:
                                        TextStyle(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreenAccent,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ),
                                    Text("02:45 pm")
                                  ],
                                ),
                              ],
                            ),
                          ),SizedBox(height: 15,),
                        ],
                      ),
                      SizedBox(height: 8,),

                    ],
                  ),
                ),
              ),

            ],
          ),

      ),
    );
  }
}
