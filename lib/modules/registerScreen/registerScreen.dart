import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/shared/network/local/cashe_helper.dart';

import '../../../layout/shopLayout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/cubit/cubit.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class  RegisterScreen extends StatelessWidget
{
var formKey = GlobalKey<FormState>();
var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var phoneController = TextEditingController();

@override
Widget build(BuildContext context)
{
  return BlocProvider(
    create: (BuildContext context) => ShopRegisterCubit(),
    child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
      listener: (context, state)
      {
        if (state is ShopRegisterSuccessState)
        {
          if (state.loginModel.status)
          {
            print(state.loginModel.message);
            print(state.loginModel.data!.token);

            CasheHelper.setData(
              key: 'token',
              value: state.loginModel.data!.token,
            ).then((value)
            {
              token = state.loginModel.data!.token??'';

              navigatePushAndRemove(
                context,
                ShopLayout(),
              );
            });
          } else {
            print(state.loginModel.message);

            showToast(

              state: ToastStates.ErrOR,
              message: state.loginModel.message,
            );
          }
        }
      },
      builder: (context, state)
      {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Register now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultFormField(
                        controler: nameController,
                         keyboardType: TextInputType.name,
                        validat:  (String value) {
                          if (value.isEmpty) {
                            return 'please enter your name';
                          }
                        },
                        labelText:  'User Name',
                        prefexIcon:  Icons.person,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controler: emailController,
                        keyboardType: TextInputType.name,
                        validat:  (String value) {
                          if (value.isEmpty) {
                            return 'please enter your email';
                          }
                        },
                        labelText:  'Email',
                        prefexIcon:  Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                       controler: passwordController,
                        keyboardType:  TextInputType.visiblePassword,
                       suffexIcon: ShopRegisterCubit.get(context).suffix,
                        onSubmit: (value)
                        {

                        },
                        isObSecureText:  ShopRegisterCubit.get(context).isPassword,
                        suffexPressed: () {
                          ShopRegisterCubit.get(context)
                              .changePasswordVisibility();
                        },
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'password is too short';
                          }
                        },
                        labelText:  'Password',
                        prefexIcon: Icons.lock_outline,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controler: phoneController,
                        keyboardType:  TextInputType.phone,
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'please enter your phone number';
                          }
                        },
                        labelText:  'Phone',
                        prefexIcon: Icons.phone,
                       // onTap: (){}
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopRegisterLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState!.validate())
                            {
                              ShopRegisterCubit.get(context).userRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                            //  AppCubit.get(context).getUserData;

                            }
                          },
                          text: 'REGISTER',

                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
}