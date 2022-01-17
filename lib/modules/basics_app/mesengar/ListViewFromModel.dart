import 'package:flutter/material.dart';
import 'package:jooo/models/user_model.dart';


class UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: "yousef", phone: "123456666"),
    UserModel(id: 2, name: "ebrahm", phone: "123456666"),
    UserModel(id: 3, name: "esmaeel", phone: "123456666"),
    UserModel(id: 1, name: "yousef", phone: "123456666"),
    UserModel(id: 2, name: "ebrahm", phone: "123456666"),
    UserModel(id: 3, name: "esmaeel", phone: "123456666"),
    UserModel(id: 1, name: "yousef", phone: "123456666"),
    UserModel(id: 2, name: "ebrahm", phone: "123456666"),
    UserModel(id: 3, name: "esmaeel", phone: "123456666"),
    UserModel(id: 1, name: "yousef", phone: "123456666"),
    UserModel(id: 2, name: "ebrahm", phone: "123456666"),
    UserModel(id: 3, name: "esmaeel", phone: "123456666"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
      ),
      body: Padding(
        
        padding: EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: (context,index)=>buildUserModel(users[index]),
            separatorBuilder: (context,index)=>Container(
              margin: EdgeInsetsDirectional.only(
                top: 10,
                bottom: 10
              ),
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            itemCount: users.length)
      ),
    );
  }
    Widget buildUserModel(UserModel user)=> Row(
  children: [
    CircleAvatar(
      radius: 25,
      backgroundColor: Colors.blue,
      child: Text(
        "${user.id}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
      ),
    ),
    SizedBox(width: 15,),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
         " ${user.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        ),
        Text(
          " ${user.phone}",style: TextStyle(color: Colors.grey,fontSize: 18),
        ),
      ],

    )
  ],
);
}
