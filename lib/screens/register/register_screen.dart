import 'package:flutter/material.dart';
import 'package:shopapp/models/member.dart';
import 'package:shopapp/screens/login/login_screen.dart';
import 'package:shopapp/services/register_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController textUserNameController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayıt Ekranı"),
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Spacer(),
              Center(child:buildUserNameField() ,),
              //buildUserNameField(),
              Center(child: buildPasswordField()),
              Spacer(),
              ElevatedButton(onPressed: (){
                debugPrint(textPasswordController.text + " " + textUserNameController.text);
                Navigator.pushReplacementNamed(context, "/");
                Member member;
                member.name = textUserNameController.text;
                member.password = textPasswordController.text;
                //RegisterService.myUser(member);
                //Navigator.pushReplacementNamed(context, "/");
              }, child: Align(alignment: Alignment.bottomCenter,child: Text("Kayıt ol"),)),
              Text("Hesabın var mı ?"),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacementNamed(context,"/login");
              }, child: Align(alignment: Alignment.bottomCenter,child: Text("Giriş Yap")))

            ],
          )),
    );
  }
  Widget buildUserNameField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: "Adı", hintText: "test",border: OutlineInputBorder()),
        controller: textUserNameController,
        onSaved: (String value){
          textPasswordController.text = value;
          debugPrint(textPasswordController.text);

        },

      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: "Şifre", hintText: "test",border: OutlineInputBorder()),
        controller: textPasswordController,
        onSaved: (String value){
          textPasswordController.text = value;
          debugPrint(textPasswordController.text);
        },

      ),
    );
  }
}
