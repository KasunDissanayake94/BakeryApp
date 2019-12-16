import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled1/payment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Colors.purple,
                  ),
                  Positioned(
                    bottom: 55.0,
                    right: 100.0,
                    child: Container(
                      height: 350.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(320),
                        color: Colors.deepPurpleAccent
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    left: 130.0,
                    child: Container(
                      height: 290.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(320),
                        color: Colors.pinkAccent
                      ),
                    ),
                  ),
                  Column(
                    //crossAllignment
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 14.0,

                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 14.0,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 2.0
                              ),
                              image: DecorationImage(
                                image: AssetImage('images/profile.jpg'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-120,),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: (){},
                              color: Colors.white,
                              iconSize: 28.0,
                                ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                      SizedBox(height: 45.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Welcome to Bakery',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0,right: 15.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(25),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.purpleAccent,
                                size: 30.0,
                              ),
                              contentPadding:
                                EdgeInsets.only(left: 20, top: 15,bottom: 10),
                              hintText: 'Search here',
                              hintStyle: TextStyle(
                                color: Colors.purpleAccent
                              )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0)

                    ],
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Stack(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Material(
                    elevation: 1.0,
                    child: Container(
                      height: 70.0,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width/4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/breadfull.jpg')
                                )
                              ),
                            ),
                            Text(
                              'Bread',
                              style: TextStyle(fontFamily: 'Quicksnad'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width/4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/hotdog.jpeg')
                                  )
                              ),
                            ),
                            Text(
                              'Hot-Dog',
                              style: TextStyle(fontFamily: 'Quicksnad'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width/4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/burger.jpeg')
                                  )
                              ),
                            ),
                            Text(
                              'Burger',
                              style: TextStyle(fontFamily: 'Quicksnad'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width/4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/donut.jpeg')
                                  )
                              ),
                            ),
                            Text(
                              'Doenut',
                              style: TextStyle(fontFamily: 'Quicksnad'),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          specialItemCard('Bread', 'images/breadfull.jpg',false ,'Rs 70.00', context),
          specialItemCard('Hot Dog', 'images/hotdog.jpeg',false ,'Rs 50.00', context),
          specialItemCard('Burger', 'images/burger.jpeg',false ,'Rs 100.00', context),
          specialItemCard('Doenut', 'images/donut.jpeg',false ,'Rs 50.00', context),
        ],
      ),
    );
  }

}

Widget specialItemCard (String title, String imagePath, bool loveStates, String price, BuildContext context){

  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
    child: Container(
      height: 140.0,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: 140.0,
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(width: 4.0),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 45.0),
                  Material(
                    elevation: loveStates ? 0.0 : 2.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: loveStates ? Colors.grey.withOpacity(0.3): Colors.white
                      ),
                      child: Center(
                        child: loveStates ? Icon(Icons.favorite_border):Icon(Icons.favorite_border, color: Colors.red,),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.0),
              Container(
                width: 170.0,
                child: Text(
                  'This is a special deal',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 13.0
                  ),
                )
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(price,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  RaisedButton(
                    textColor: Colors.yellow,
                    color: Colors.black,
                    child: Text("Add to cart"),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context) {
  return new Payment();
                      }));
                    },
                  )

                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

