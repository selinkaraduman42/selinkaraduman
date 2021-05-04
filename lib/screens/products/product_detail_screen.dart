import 'package:flutter/material.dart';
import 'package:shopapp/models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product;

  ProductDetailScreen(this.product);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState(product);
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtUnitPrice = TextEditingController();
  TextEditingController txtCategory = TextEditingController();

  @override
  initState() {
    txtName.text = product.name;
    txtUnitPrice.text = product.price.toString();
    txtCategory.text = product.category.toString();

    super.initState();
  }

  Product product;

  _ProductDetailScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(txtName.text,)),
      body: buildProductDetail(),
    );
  }

  buildProductDetail() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            buildImageField(),
            buildNameField(),
            buildPriceField(),
            buildCategoryField()
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Ürün: " + txtName.text),
    );
  }

  Widget buildImageField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,20.0),
      child: Image.network(
        "https://cdn03.ciceksepeti.com/cicek/kc2347041-1/XL/samsung-galaxy-tab-a-8-sm-t297-32gb-tablet-sim-kartli-siyah-kc2347041-1-f8958301648549539a147bdf32c295b6.jpg",
        height: 200,
        width: 200,
      ),
    );
  }

  Widget buildPriceField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Fiyat:  "+txtUnitPrice.text),
    );
  }

  Widget buildCategoryField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Kategori: "+txtCategory.text),
    );
  }
}
