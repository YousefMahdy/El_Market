import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jooo/layout/shopLayout/shopLayout.dart';

import 'package:jooo/modules/shop_app/login/cubit/cubit.dart';
import 'package:jooo/modules/shop_app/login/cubit/states.dart';
import 'package:jooo/modules/shop_app/registerScreen/registerScreen.dart';
import 'package:jooo/shared/components/components.dart';
import 'package:jooo/shared/network/local/cashe_helper.dart';

import '../../../shared/components/constants.dart';

class ShopLogin extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var form_Key = GlobalKey<FormState>();
  bool visable_Password = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if(state is ShopLoginSuccessState){
            if(state.loginModel.status){
              showToast(message: state.loginModel.message, state: ToastStates.SUCCESS);

              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              CasheHelper.setData(key: "token", value: state.loginModel.data!.token).then((value){
                token = state.loginModel.data!.token??"";
                navigatePushAndRemove(context, ShopLayout());
              });



            }else{
              print(state.loginModel.message);

              showToast(message: state.loginModel.message, state: ToastStates.ErrOR);
            }
          }
        },
        builder: (context, state) {
          ShopLoginCubit cubit = ShopLoginCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(""),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: form_Key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Login",
                            style: //Theme.of(context).textTheme.headline5?.copyWith(color:Colors.grey )
                                TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "pleas Enter your Email";
                              }
                            },
                            decoration: InputDecoration(
                              // border: InputBorder.none,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              labelText: "Email",


                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          defaultFormField(
                              labelText: "password",
                              controler: passwordController,
                              prefexIcon: Icons.lock,
                              suffexIcon: cubit.isPasswod
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              onSubmit: (s) {
                                if (form_Key.currentState!.validate()) {
                                  cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                             // onChange: (x) {},
                              suffexPressed: () {
                                cubit.changePasswordVisability(cubit.isPasswod);
                              },
                              validat: (s) {
                                if (s.isEmpty)
                                  return "pleas Enter your password";
                              },
                              keyboardType: TextInputType.visiblePassword,
                              isObSecureText: cubit.isPasswod),
                          SizedBox(
                            height: 50,
                          ),
                          ConditionalBuilder(
                              condition: state is! ShopLoginLoadingState,
                              builder: (context) => defaultButton(
                                    text: "LOGIN",
                                    color: Colors.blue,
                                    function: () {
                                      if (form_Key.currentState!.validate()) {
                                        cubit.userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                  ),
                              fallback: (context) => Center(
                                    child: CircularProgressIndicator(),
                                  )),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don\'t have account "),
                              TextButton(
                                  onPressed: () {
                                    navigateTo(context, RegisterScreen());
                                  },
                                  child: Text("Register"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
