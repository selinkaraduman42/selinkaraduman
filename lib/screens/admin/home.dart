import 'package:flutter/material.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/screens/admin/product_add_screen.dart';
import 'package:shopapp/services/product_service.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _HomeScreenState(){
    products = ProductService.getAll();

  }

  List<Product> products=[];
  int productCount = 0;

/*  @override
  void initState() {
    setState(() {
      products = ProductService.getAll();
      this.productCount = products.length;
    });
  }

 */
  @override
  void initState() {
    super.initState();
    products = ProductService.getAll();
    this.productCount = products.length;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Page")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: Icon(Icons.add),
        tooltip: "Yeni Ürün Ekle",
      ),
      body: Container(),
    );
  }




}