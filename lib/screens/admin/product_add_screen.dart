import 'package:flutter/material.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/screens/products/product_list_screen.dart';
import 'package:shopapp/services/product_service.dart';
import 'package:uuid/uuid.dart';

class ProductAddScreen extends StatefulWidget {
  @override
  _ProductAddScreenState createState() => _ProductAddScreenState();
}


class _ProductAddScreenState extends State<ProductAddScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtCategory = TextEditingController();

  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ürün Ekle")),
        body: Column(
          children: [
            buildNameField(),
            buildPriceField(),
            buildCategoryField(),
            buildSaveButton()
          ],
        ));
  }

  TextField buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Adı"),
      controller: txtName,
    );
  }

  TextField buildCategoryField() {
    return TextField(
      decoration: InputDecoration(labelText: "Category"),
      controller: txtCategory,
    );
  }

  TextField buildPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Fiyatı"),
      controller: txtPrice,
    );
  }

  void addProduct() {
    final newProduct = new Product(int.tryParse(uuid.v1()), txtName.text,
        double.tryParse(txtPrice.text), txtCategory.text);
    ProductService.addProduct(newProduct);
    ProductService.getAll();
    Navigator.pushNamed(context,"/");
  }

  buildSaveButton() {
    return ElevatedButton(
      child: Text("Ekle"),
      onPressed: () {
        addProduct();
        print(txtName.text + " " + txtCategory.text + " " + txtPrice.text);
      },
    );
  }
}
