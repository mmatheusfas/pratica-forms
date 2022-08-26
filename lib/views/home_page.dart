import 'package:flutter/material.dart';
import 'package:pratica_forms/widgets/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final formKey = GlobalKey<FormState>();
  //Widget Form possui um estado publico, usando uma GlobalKey conseguimos ter acesso
  //a esse estado do Form 

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
            const CustomTextField(
              icon: Icons.person,
              label: "Name",
              hintText: "Type your name...",
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              icon: Icons.mail,
              label: "E-mail",
              hintText: "Type your e-mail...",
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              icon: Icons.lock,
              label: "Password",
              hintText: "Type your password...",
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              icon: Icons.person,
              label: "Confirm Password",
              hintText: "Type your password...",
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState?.validate();
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
