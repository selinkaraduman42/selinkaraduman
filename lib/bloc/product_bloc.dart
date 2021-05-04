import 'dart:async';

import 'package:shopapp/models/product.dart';
import 'package:shopapp/services/product_service.dart';

class ProductBloc{
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;
  List<Product> getAll(){
    return ProductService.getAll();
  }
  void addProduct(Product item){
    ProductService.addProduct(item);
    productStreamController.sink.add(ProductService.getProduct());
  }
  List<Product> getProduct(){
    return ProductService.getProduct();
  }

}

final productBloc = ProductBloc();