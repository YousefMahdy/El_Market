import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';

class  SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).userModel;

       // nameController.text = model!.data!.name??"";
       // emailController.text =model!.data!.name??"";
       // phoneController.text =model!.data!.name??"";

        return ConditionalBuilder(
          condition:true,//s ShopCubit.get(context).userModel != null,
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children:
                  [
                    if(state is ShopLoadingUpdateUserState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controler: nameController,
                      keyboardType: TextInputType.name,
                      validat: (String value) {
                        if (value.isEmpty) {
                          return 'name must not be empty';
                        }

                        return null;
                      },
                      labelText:  'Name',
                      prefexIcon:  Icons.person,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controler: emailController,
                      keyboardType:  TextInputType.emailAddress,
                      validat:  (String value) {
                        if (value.isEmpty) {
                          return 'email must not be empty';
                        }

                        return null;
                      },
                      labelText:   'Email Address',
                      prefexIcon: Icons.email,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controler: phoneController,
                      keyboardType:  TextInputType.phone,
                      validat: (String value) {
                        if (value.isEmpty) {
                          return 'phone must not be empty';
                        }

                        return null;
                      },
                      labelText:  'Phone',
                      prefexIcon:  Icons.phone,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                      function: ()
                      {
                        if(formKey.currentState!.validate()){
                          print(nameController.text);
                          // ShopCubit.get(context).updateUserData(
                          //   name: nameController.text,
                          //   email: "jousef2@gmail.com",
                          //   phone: '12895555'
                          //
                          // );
                          ShopCubit.get(context).updateUserData(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                          );
                        }
                       print(model!.data!.name);
                       // print(model.data!.email);
                      },
                      text: 'UPDATE',
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                      function: () {
                        logOut(context);
                      },
                      text: 'LOGOUT',
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
