import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:jooo/modules/news_app/web_view/web_view_screen.dart';

import 'package:jooo/shared/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color color = Colors.blue,
  double radius = 10.0,
  required Function function,
  String text = "test",
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radius)),
    child: MaterialButton(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        function();
      },
    ),
  );
}

Widget defaultFormField({
  String? labelText,
  required TextEditingController controler,
  bool isObSecureText = false,
  required TextInputType keyboardType,
  IconData? prefexIcon,
  IconData? suffexIcon,
  required Function validat,
  Function? prefex_pressed,
  Function? onSubmit,
  //Function? onChange,
  Function? onTap,
  Function? suffexPressed,
}) {
  return TextFormField(
    controller: controler,
    obscureText: isObSecureText,
    keyboardType: keyboardType,
    onTap: (){

    },
    onFieldSubmitted: (value) {
      //print(value);
      onSubmit!(value);
    },
    onChanged: (s) {
      //onChange!(s);
    },
    validator: (s) => validat(s),


    decoration: InputDecoration(
// border: InputBorder.none,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        labelText: labelText,
// label: Text("gggggg")

        prefixIcon: IconButton(
          icon: Icon(prefexIcon),
          onPressed: () {}
          //print("prefex presssed");
          ,
        ),
        //suffixIcon: Icon(safexIcon)),
          suffixIcon:  InkWell(
                      child:Icon(suffexIcon),
            onTap:(){
              suffexPressed!();
              //print("GGGGGGGGGGGGGGGGGGG");
            } ,
          ) ,



        )
  );

}


Widget buildTaskItem(Map row, context) => Dismissible(
      key: Key(row['id'].toString()),
      onDismissed: (directions) {
        AppCubit.get(context).deleteDatabase(id: row['id']);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text("${row["time"]}"),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${row["title"]}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${row["date"]}",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateDatabase(status: "done", id: row['id']);
              },
              icon: Icon(
                Icons.check_box_outlined,
                color: row["status"] == "done" ? Colors.green : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateDatabase(status: "archive", id: row['id']);
              },
              icon: Icon(
                Icons.archive_outlined,
                color:
                    row["status"] == "archive" ? Colors.blueGrey : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );

Widget BuildArticleItem({
  required article,
  required context
}){
  return  InkWell(

    onTap: () {

        navigateTo(context, WebViewScreen(article['url']));

    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [

          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(

                  fit: BoxFit.cover,

              image:NetworkImage('${article["urlToImage"]??"https://cdni.rt.com/media/pics/2022.01/original/61d4cd5e4236042dec695982.jpg"}'),

                  //AssetImage('${article["urlToImage"]}')
              ),//NetworkImage(""),



            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child:Container(
              height: 120,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${article["title"]}",
                      style:Theme.of(context).textTheme.bodyText1,
                      maxLines:3,
                      overflow:  TextOverflow.ellipsis,),
                  ),
                  Text("${article["publishedAt"]}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                    ),


                  ),


                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
Widget BuildSeperatItem(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
  );
}

Widget articleBuilder(list,{ isSearch=false})=>ConditionalBuilder(
  condition: list.isEmpty,
  builder: (context) =>isSearch?Container(): Center(child: CircularProgressIndicator()),
  fallback: (context) =>  ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder:(context,index) =>BuildArticleItem(article: list[index],context: context),
      separatorBuilder:(context,index) =>BuildSeperatItem(),
      itemCount: list.length),
);

void navigateTo(context,widget)=>Navigator.push(
  context,MaterialPageRoute(builder: (context)=>widget ));
void navigatePushAndRemove(context,widget)=>Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context)=>widget), (route) => false);

void showToast({
  required String message,
  required ToastStates state, text,
})=>
   Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
enum ToastStates{ErrOR,WORNING,SUCCESS}

Color chooseToastColor(ToastStates state){
  Color color;

  switch(state){
    case ToastStates.SUCCESS:
      color=Colors.greenAccent;
      break;
    case ToastStates.ErrOR:
      color=Colors.red;
      break;
    case ToastStates.WORNING:
      color=Colors.amber;
      break;

  }
    return color;
}
