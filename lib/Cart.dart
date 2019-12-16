import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:dropdownfield/dropdownfield.dart';


class Cart extends StatelessWidget {
  List<String> quantities = ['1', '2', '3', '4' ,'5', '6'];
  var quantity ='';


  Widget buildDot(int index,int num){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(

            color: (num == index ) ? Colors.black38 : Colors.grey[200],
            shape: BoxShape.circle
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Cart'),
        elevation: 0.0,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Colors.grey[300],
                    width: 1.0
                )
            )
        ),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 280.0,
                  padding: EdgeInsets.only(top: 10.0),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        child: PageView(

                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/donut.jpeg'),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          buildDot(0,0),
                          buildDot(0,1),
                          buildDot(0,2),
                          buildDot(0,3)

                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 270.0,
                    alignment: Alignment(1.0, 1.0),
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Column(
                        verticalDirection: VerticalDirection.down,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[


                        ],
                      ),
                    )
                )
              ],
            ),
            Divider(color: Colors.grey[300],height: 1.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Jelly Doughnuts",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19.0),),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text("You can use any flavor of jelly or jam to make this recipe. Serve plain, sugared, or frosted."),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DropDownField(
                      value: quantity,
                      required: true,
                      strict: true,
                      labelText: 'Quantity',
                      items: quantities,
                      setter: (dynamic newValue) {
                        quantity = newValue;
                      }
                  ),

                ],
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 18.0),
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(color: Colors.grey[300],width: 1.0)
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    padding: EdgeInsets.all(10.0),
                    child: Text("Total Amount",style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                  ),
                  Text("Rs 50.00",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            RaisedButton(
              color: Colors.deepOrange,
              onPressed: (){

              },
              child: Text("BUY",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }

  void _creditCard(){
    InAppPayments.setSquareApplicationId("XXXXXXXXXXXXXXXXXXXXXXXXX");
    InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess:_success,
      onCardEntryCancel: entryCancel,
    );
  }

  void _success(CardDetails cardDetails){
    InAppPayments.completeCardEntry(
        onCardEntryComplete: _cardEntryComplete
    );
  }
  void _cardEntryComplete(){

  }

  void entryCancel(){
    print("Cancel");
  }


}

