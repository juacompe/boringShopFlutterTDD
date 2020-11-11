

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductDetailsPage extends HookWidget {
  Map<String, dynamic> item;

  ProductDetailsPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
        key: Key('Product Details'),
        actions: [
          Container(
            child: GestureDetector(
              key: Key('back'),
              child: Text('<'),
              onTap: () => Navigator.of(context).pop()
            )
          ),
        ],
      ),
    );
  }
}
