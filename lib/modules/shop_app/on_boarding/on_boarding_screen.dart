

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jooo/modules/shop_app/login/shop_logIn.dart';
import 'package:jooo/shared/components/components.dart';
import 'package:jooo/shared/cubit/cubit.dart';
import 'package:jooo/shared/network/local/cashe_helper.dart';
import 'package:jooo/shared/stylse/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BoadingModel{
  final String image;
  final String title;
  final String body;
  BoadingModel({
    required this.body,
    required this.title,
    required this.image});
}

class OnBoardingScreen  extends StatelessWidget {
  var bordingcontroler =PageController();
  List <BoadingModel> boarding =[
    BoadingModel(
        image:'assets/images/logo.png',
        title: "boarding titlt 1",
        body: "bording body 1"

    ), BoadingModel(
        image:'assets/images/logo.png',
        title: "boarding titlt 2",
        body: "bording body 2"

    ), BoadingModel(
        image:'assets/images/logo.png',
        title: "boarding titlt 3",
        body: "bording body 3"

    )
  ];
    bool isLast=false;
    void FinishBoading(BuildContext context){
      CasheHelper.setData(key: "onBoarding", value: true).then((value){
        if(value=true){
          navigatePushAndRemove(context, ShopLogin());

        }
      }).catchError((e)
      {
        print("error");
      });
      

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          TextButton(onPressed: (){
            FinishBoading(context);

          }, child: Text("SKIP")),
          SizedBox(width: 20,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(itemBuilder: (context,index)=>buildItemBoarding(boarding[index]),
              itemCount: boarding.length,
                physics: BouncingScrollPhysics(),
                controller:bordingcontroler,
                onPageChanged: (index){
                if(index==boarding.length-1){
                  isLast=true;
                }else{
                  isLast=false;
                }
                },

              ),
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                SmoothPageIndicator(
                  controller:bordingcontroler ,
                  count: boarding.length,
                  effect:ExpandingDotsEffect(
                    dotColor: Colors.grey,
                     activeDotColor: defaultColor,
                     spacing: 15,
                    expansionFactor: 2,
                    strokeWidth: 20



                  ) ,
                ),
                Spacer(),
                FloatingActionButton(onPressed: (){
                  if(isLast==true){
                    FinishBoading(context);
                  }else{
                    bordingcontroler.nextPage(

                        duration: Duration(
                            milliseconds: 600
                        ),
                        curve: Curves.fastOutSlowIn);
                  }


                },child: Icon(
                    Icons.arrow_forward_ios_outlined
                ),

                )


              ],
            )
          ],
        ),
      )
    );
  }
  Widget buildItemBoarding(BoadingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child:
      Image.asset("${model.image}")),
      Text(("${model.title}"),style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
      ),

      SizedBox(height: 15,),
      Text(("${model.body}"),style: TextStyle(fontSize: 18,),),





    ],
  );




}
