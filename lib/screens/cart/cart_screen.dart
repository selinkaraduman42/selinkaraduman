import 'package:flutter/material.dart';
import 'package:shopapp/bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sepet"),
        ),
        body: StreamBuilder(
            stream: cartBloc.getStream,
            initialData: cartBloc.getCart(),
            builder: (context, snapshot) {
              return buildCard(snapshot);
            }));
  }

  Widget buildCard(AsyncSnapshot snapshot) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, item) {
                final cart = snapshot.data;
                return ListTile(
                  title: Text(cart[item].product.name),
                  subtitle: Text(cart[item].product.price.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      cartBloc.removeFromCart(cart[item]);
                    },
                  ),
                );
              }),
          Spacer(),
          ElevatedButton(
              onPressed: () {
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Alışverişi Tamamla"),
              )),
        ],
      ),
    );
  }


  }
