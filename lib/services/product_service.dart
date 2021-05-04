
import 'package:shopapp/models/product.dart';

class ProductService{
  static List<Product> products=[];
  ProductService._internal();

  static ProductService _singleton = ProductService._internal();

  factory ProductService(){
    return _singleton;
  }
  static void addProduct(Product item) {
    products.add(item);
  }
  static List<Product> getProduct() {
    return products;
  }
  static List<Product> getAll(){

    return products;
  }
}