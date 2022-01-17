import 'package:flutter/material.dart';
import 'package:jooo/shared/components/components.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var form_Key = GlobalKey<FormState>();
  bool visable_Password = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("joooo"),
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
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        //print(value);
                      },
                      onChanged: (Vaue) {
                        //print(Vaue);
                      },
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
                        // label: Text("gggggg")
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    defaultFormField(
                      labelText: "password",
                        prefexIcon: Icons.lock,
                        suffexIcon: visable_Password
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onSubmit: (s){
                          print (s);
                          print("yousef");
                        },
                        // onChange: (s){
                        //   print(s);
                        // },
                         validat: (s)  {
                           if (s.isEmpty)
                             return "pleas Enter your password";
                         },
                        controler: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        isObSecureText: true),
                    SizedBox(
                      height: 50,
                    ),
                    defaultButton(
                      text: "LOGIN",
                      color: Colors.blue,
                      function: () {
                        if (form_Key.currentState!.validate()) {
                          print("vvvvvv");
                        }
                      },
                    ),

                    // Container(
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                    //   child: MaterialButton(
                    //     child: Text(
                    //       "jjjjjj",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     onPressed: (){
                    //       if(form_Key.currentState!.validate()){
                    //        print(emailController.text);
                    //         print("1111hhhhhhhhhhhh");
                    //       }
                    //       print("hhhhhhhhhhhh");
                    //     },
                    //   ),
                    // ),
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
                        TextButton(onPressed: () {}, child: Text("Register"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
