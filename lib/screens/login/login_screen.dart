import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textUserNameController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Ekranı"),
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
        children: [
          buildUserNameField(),
          buildPasswordField(),
          Spacer(),
          ElevatedButton(onPressed: (){
            debugPrint(textPasswordController.text + " " + textUserNameController.text);
            if(textUserNameController.text == "admin" && textPasswordController.text == "admin"){
              Navigator.pushReplacementNamed(context, "/admin");
            }
          }, child: Align(alignment: Alignment.bottomCenter,child: Text("Giriş"),))

        ],
      )),
    );
  }
  Widget buildUserNameField() {
    return TextFormField(

      decoration: InputDecoration(labelText: "Adı", hintText: "admin"),
      controller: textUserNameController,
      onSaved: (String value){
        textPasswordController.text = value;
        debugPrint(textPasswordController.text);

      },

    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Şifre", hintText: "admin"),
      controller: textPasswordController,
      onSaved: (String value){
        textPasswordController.text = value;
        debugPrint(textPasswordController.text);
      },

    );
  }
}
