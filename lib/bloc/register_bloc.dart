import 'dart:async';

import 'package:shopapp/models/product.dart';
import 'package:shopapp/services/product_service.dart';

class ProductBloc{
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;
  List<Product> getAll(){
    return ProductService.getAll();
  }
}

final productBloc = ProductBloc();