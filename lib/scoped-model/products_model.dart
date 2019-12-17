import 'package:scoped_model/scoped_model.dart';
import 'package:untitled1/model/Product.dart';
import 'package:untitled1/model/Hotel.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsModel extends Model {
  List<Hotel> _hotelList = [];
  List<Product> _products = [];
  List<Product> _cartList = [];
  final baseUrl = 'http://api.flutterapp.in/api/';

  ProductsModel() {
    _products.add(Product(
      'PRAWN BUN',
      'Category: Savouries',
      65,
      'http://theroyalbakery.com/wp-content/uploads/2018/08/Prawn-Bun-600x588.jpg',
    ));

    _products.add(Product(
      'VEGETABLE BURGER',
      'Category: Savouries',
      85,
      'http://theroyalbakery.com/wp-content/uploads/2018/08/Vegetable-Burger.jpg',
    ));

    _products.add(Product(
      'VEGETABLE CHINESE ROLL',
      'Category: Savouries',
      40,
      'https://www.dinneratthezoo.com/wp-content/uploads/2016/10/veggie-fried-rice-6-500x500.jpg',
    ));

    _products.add(Product(
      'CHICKEN PIZZA',
      'Category: Savouries',
      100,
      'http://theroyalbakery.com/wp-content/uploads/2018/08/Chicken-Pizza-600x450.jpg',
    ));

    _products.add(Product(
      'CHICKEN AND MUSHROOM PASTRY',
      'Category: Savouries',
      60,
      'http://theroyalbakery.com/wp-content/uploads/2018/08/Chicken-Mushroom-Pastry-600x744.jpg',
    ));

    _products.add(Product(
      'TRUFFLE GATEAUX',
      'Category: Savouries',
      1400,
      'http://theroyalbakery.com/wp-content/uploads/2016/11/10.jpg',
    ));

    _hotelList.add(Hotel(
        'Butter Boutique',
        'http://static.sundaytimes.lk/wp-content/uploads/2016/03/Butter-boutique.jpg',
        'Cafe, Vegetarian Friendly',
        '8:00 AM - 8:00 PM',
        4.5,
        500));

    _hotelList.add(Hotel(
        'The Coffee Stop',
        'https://cinnamonweb.blob.core.windows.net/cinnamonweb-prd/dining_wellness/coffee-stop-grand-530X420.jpg',
        'Bakeries, Cafe, Vegetarian Friendly',
        '8:00 AM - 8:00 PM',
        4.5,
        500));

    _hotelList.add(Hotel(
        'BreadTalk - Lipton Circus',
        'https://www.yamu.lk/wp-content/uploads/2013/03/DSCF4363-600x398.jpg',
        'Bakeries, American, Singaporean',
        '8:00 AM - 8:00 PM',
        4.0,
        500));

  }

  List<Product> get products {
    return List.from(_products);
  }

  List<Product> get getCartList {
    return List.from(_cartList);
  }

  List<Hotel> get getHotelList {
    return List.from(_hotelList);
  }

  double get getCartPrice {
    double price = 0;
    getCartList.forEach((Product pro) {
      price += pro.price;
    });
    return price;
  }

  void addProduct(Product product) {
    final Map<String, dynamic> productMap = {
      'title': product.title,
      'description': product.description,
      'price': product.price,
      'image':
      'https://www.dinneratthezoo.com/wp-content/uploads/2016/10/veggie-fried-rice-6-500x500.jpg',
    };

    http.post(
      baseUrl + 'products',
      body: json.encode(productMap),
      headers: {
        'Content-Type': 'application/json',
      },
    ).then(
          (response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      },
    );
    _products.add(product);
    notifyListeners();
  }

  getProductList() async {
    final data = await  http
        .get(
      baseUrl + 'products',
    )
        .then(
          (response) {

      },
    );

  }

  void addToCart(Product product) {
    _cartList.add(product);
    notifyListeners();
  }
}