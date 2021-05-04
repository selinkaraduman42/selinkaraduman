import 'package:shopapp/main.dart';
import 'package:shopapp/models/member.dart';

class RegisterService {
  //static List<Cart> cartItems = List<Cart>();
  //static List<Cart> cartItems=[];

  RegisterService._internal();
  static RegisterService _singleton = RegisterService._internal();

  factory RegisterService() {
    return _singleton;
  }
}
