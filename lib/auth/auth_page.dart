import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthpageState();
  }
}

class _AuthpageState extends State<AuthPage> {
  bool _isLogin = true;
  void changePage(bool isLogin) {
    setState(() {
      // print(isLogin);
      _isLogin = isLogin;
    });
  }

  // Widget currentPage = LoginPage(changePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 4, // default value
      //   title: Text('Authenticate'),
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(
              'http://www.gandummas.co.id/wp-content/uploads/2015/02/Seven-Bakery.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop)
            // colorFilter: ColorFilter.mode(
            // Colors.black.withOpacity(0.5),
          ),
        ),
        padding: EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: Image.network(
                      'https://www.pngkey.com/png/full/303-3039991_burrito-icon-png-chef-icon-png-white.png'),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Bakery',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                _isLogin ? LoginPage(changePage) : SignUpPage(changePage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}