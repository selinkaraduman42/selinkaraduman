import 'package:flutter/material.dart';
import 'package:shopapp/main.dart';
import 'package:shopapp/models/member.dart';
import 'package:shopapp/services/register_service.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  void initState() {
    // TODO: implement initState
    //String member = RegisterService.member.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                InkWell(
                  onTap: () {},
                  splashColor: Colors.orange,
                  child: ListTile(
                    leading: Icon(Icons.login),
                    title: Text("Giriş Yap"),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pushNamed(context, "/login");
                    },
                  ),
                ),
                Divider(),
                /*
                InkWell(
                  onTap: () {},
                  splashColor: Colors.orange,
                  child: ListTile(
                    leading: Icon(Icons.how_to_reg),
                    title: Text("Kayıt ol"),
                    trailing: Icon(Icons.chevron_right),
                    onTap: (){
                      Navigator.pushNamed(context, "/register");
                    },
                  ),
                ),
                Divider(), */
                InkWell(
                  onTap: () {},
                  splashColor: Colors.orange,
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Hakkımızda"),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pushNamed(context, "/hakkimizda");
                    },
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.orange,
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Ana Sayfa"),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.orange,
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Sepet"),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pushNamed(context, "/cart");
                    },
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
