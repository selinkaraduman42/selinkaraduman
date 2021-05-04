import 'package:flutter/material.dart';
import 'package:shopapp/bloc/cart_bloc.dart';
import 'package:shopapp/bloc/product_bloc.dart';
import 'package:shopapp/models/cart.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/screens/cart/cart_screen.dart';
import 'package:shopapp/screens/products/product_detail_screen.dart';
import 'package:shopapp/widgets/drawer_menu.dart';


class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int selectedMenuItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,0.0,10.0,0),
          child: Center(child: Text("SHOPPING",style: TextStyle(color:Colors.white),)),
        )),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      drawer: DrawerMenu(),
      body:
      buildProductList(),
      bottomNavigationBar:BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        fixedColor: Colors.grey,
        onTap: (index){
          setState(() {
            selectedMenuItem = index;
            if(index==0){
              Navigator.pushNamed(context, "/");
            }else if(index==1){

            }else if(index==2){

            }else if(index==3){

            }else{
              Navigator.pushNamed(context, "/cart");
            }
          });
        },
        currentIndex: selectedMenuItem,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:"Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label:"Ara"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label:"Favoriler"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label:"Sepet"),
          BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),label:"Siparişler"),
        ],
      ),
    );
  }
}

buildProductList() {
  return StreamBuilder(
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
      builder:(context,snapshot){
        return snapshot.data.length>0?buildProductListItems(snapshot):Center(child: Text("Data yok"),);
      }
  );
}

buildProductListItems(AsyncSnapshot snapshot) {
  return ListView.builder(
    itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context,index){
      final list = snapshot.data;
      return ListTile(
        onTap: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailScreen(list[index])),);
        },
        title:Text(list[index].name),
        subtitle:Text(list[index].price.toString()),
        leading: Image.network("https://cdn03.ciceksepeti.com/cicek/kc2347041-1/XL/samsung-galaxy-tab-a-8-sm-t297-32gb-tablet-sim-kartli-siyah-kc2347041-1-f8958301648549539a147bdf32c295b6.jpg"),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: (){
            cartBloc.addToCart(Cart(list[index],1));
          },
        ),
      );
    } ,
  );

}







