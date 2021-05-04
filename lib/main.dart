import 'package:flutter/material.dart';
import 'package:shopapp/screens/admin/home.dart';
import 'package:shopapp/screens/admin/product_add_screen.dart';
import 'package:shopapp/screens/cart/cart_screen.dart';
import 'package:shopapp/screens/hakkimizda/hakkimizda.dart';
import 'package:shopapp/screens/login/login_screen.dart';
import 'package:shopapp/screens/products/product_detail_screen.dart';
import 'package:shopapp/screens/products/product_list_screen.dart';
import 'package:shopapp/screens/register/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (BuildContext context) => ProductListScreen(),
        "/cart": (BuildContext context) => CartScreen(),
        "/login": (BuildContext context) => LoginScreen(),
        "/admin": (BuildContext context) => HomeScreen(),
        "/register": (BuildContext context) => RegisterScreen(),
        "/add": (BuildContext context) => ProductAddScreen(),
        "/hakkimizda": (BuildContext context) => Hakkimizda(),
      },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
    );
  }
}
