import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:untitled1/scoped-model/products_model.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child,ProductsModel model ) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Cart'), actions: <Widget>[

            ],
            ),
          );
        }
    );
  }
}