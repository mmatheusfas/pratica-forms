import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pratica_forms/models/user_model.dart';
import 'package:pratica_forms/widgets/custom_textfield.dart';
import 'package:string_validator/string_validator.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final formKey = GlobalKey<FormState>();
  //Widget Form possui um estado publico, usando uma GlobalKey conseguimos ter acesso
  //a esse estado do Form 
  User user = User();
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forms"),
      ),
      body: Form(
        key: formKey,
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            CustomTextField(
              icon: Icons.person,
              label: "Full Name",
              hintText: "Type your full name...",
              onSaved: (text) => user = user.copyWith(name: text),
              validator: (text){
                if (text!.isEmpty){
                 return "This field can\t be empty...";
                }
                if (text.length < 5){
                  return "Your name must have at lest 5 characters";
                }
                return null; 
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              icon: Icons.mail,
              label: "E-mail",
              hintText: "Type your e-mail...",
              onSaved: (text) => user = user.copyWith(email: text),
              validator: (text){
                if (text!.isEmpty){
                 return "This field can\t be empty...";
                }
                if (!isEmail(text)){
                  return "This field must be email type...";
                }
                return null; 
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              icon: Icons.lock,
              label: "Password",
              hintText: "Type your password...",
              obscureText: true,
              //onSaved: (text) => user = user.copyWith(password: text),
              onChanged: (text) => password = text!,
              validator: (text){
                if (text!.isEmpty){
                 return "This field can\t be empty...";
                } 
                if (text.length < 6){
                  return "Password must have at lest 6 characters";
                }
                return null; 
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              icon: Icons.person,
              label: "Confirm Password",
              hintText: "Type your password...",
              obscureText: true,
              onSaved: (text) => user = user.copyWith(password: text),
              onChanged: (text) => confirmPassword = text!,
              validator: (text) {
                if (text!.isEmpty){
                 return "This field can\t be empty...";
                } 
                if (confirmPassword != password){
                  return "Password and Confirm Password must be equals!";
                }

                return null;                 
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()){
                      formKey.currentState?.save();
                      showDialog(
                        context: context, 
                        builder: (context){
                          return AlertDialog(
                            title: Text("Seja bem vindo ${user.name}"),
                            content: Container(
                              height: 50, 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget> [
                                  Text("Your email: ${user.email}")
                                 ],
                              ),
                            ),
                          );
                        }
                      );
                    }
                  },
                  child: const Text("Save"),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState?.reset();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red
                  ),
                  child: const Text("Reset"),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
