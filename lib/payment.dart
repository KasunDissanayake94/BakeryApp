import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          child: Text('Go to Second Screen'),
          onPressed : _creditCard,
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

