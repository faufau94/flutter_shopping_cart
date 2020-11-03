import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:core';

import 'Notifier/manage-fav.dart';


class MyShoppingCart extends StatefulWidget {

  @override
  _MyShoppingCartState createState() => _MyShoppingCartState();
}

class _MyShoppingCartState extends State<MyShoppingCart> {

  @override
  Widget build(BuildContext context) {


    ManageFav manageFav = Provider.of<ManageFav>(context);

    final listCart = manageFav.getListCart;

    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: listCart.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = listCart[index];

            return GestureDetector(
                onTap: () {print('Item ' + item.getIndex.toString());},
                child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Item ' + item.getIndex.toString()),
                        IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              manageFav.removeFav(item.getIndex);
                            }
                        )
                      ],
                    )
                )
            );
          },
        )
    );
  }
}