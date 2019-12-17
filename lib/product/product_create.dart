import 'package:flutter/material.dart';
import 'package:untitled1/product_controller.dart';
import 'package:untitled1/model/Product.dart';
class ProductCreate extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ProductCreateState();
  }
}

class _ProductCreateState extends State<ProductCreate> {
  String title;
  String description;
  double price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              // hintText: 'Enter your product title',
                labelText: 'Product Title'),
            onChanged: (String value) {
              setState(() {
                title = value;
              });
            },
          ),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              // hintText: 'Enter your product description',
                labelText: 'Title'),
            onChanged: (String value) {
              setState(() {
                description = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Price',
              // hintText: '0.0'
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onChanged: (String value) {
              setState(() {
                price = double.parse(value);
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          // RaisedButton(onPressed: () {
          //   FocusScope.of(context).requestFocus(new FocusNode());
          // },),
          ProductController(Product(title,description,price,'https://www.dinneratthezoo.com/wp-content/uploads/2016/10/veggie-fried-rice-6-500x500.jpg')),
        ],
      ),
    );
  }
}