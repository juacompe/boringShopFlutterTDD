import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CheckOutPage extends HookWidget {
  List<dynamic> cart;

  CheckOutPage({Key key, this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text("Items:"))
                ]),
                itemList(),
              ]
            )
          )))
    );
  }

  Widget itemList() {
    return Container(
      child: Column(
        children: [
          for(int i=0; i < cart.length; i++)
            Row(
              children: [
                Text("${cart[i]['name']}", key: Key('item${cart[i]['id']+1}'))
              ],
            )
        ],
      )
    );
  }
}