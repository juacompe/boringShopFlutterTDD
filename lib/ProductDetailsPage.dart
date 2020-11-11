import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductDetailsPage extends HookWidget {
  Map<String, dynamic> item;

  ProductDetailsPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var thumbnailSize = MediaQuery.of(context).size.width * 0.5;
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: thumbnailSize,
                      height: thumbnailSize,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(thumbnailSize / 2)),
                        child: Image(image: NetworkImage(item['picture']), fit: BoxFit.cover)
                      )),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      key: Key('item2details'),
                      child: Text('Add to cart'),
                      onPressed: () {

                      },
                    ),
                  ]),
              ]
            )
          )
        )
      )
    );
  }
}
