
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CheckOutPage extends HookWidget {
  List<dynamic> cart;

  CheckOutPage({Key key, this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Checkout"))
    );
  }

}