import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'CheckOutPage.dart';
import 'ProductDetailsPage.dart';
import 'models/Items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Assuming MyApp is the real application, items should come from a real data source
    List<dynamic> items = [
      {
        'name': 'Matcha Tofu Tiramisu',
        'id': 0,
        'picture':
            'https://images.pexels.com/photos/1070850/pexels-photo-1070850.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1070850.jpg&fm=jpg',
      },
      {
        'name': 'Lovely cupcake',
        'id': 1,
        'picture':
            'https://images.pexels.com/photos/913136/pexels-photo-913136.jpeg?cs=srgb&dl=pexels-jess-bailey-designs-913136.jpg&fm=jpg',
      },
      {
        'name': 'Brownie with rice',
        'id': 2,
        'picture':
            'https://images.pexels.com/photos/2067396/pexels-photo-2067396.jpeg?cs=srgb&dl=pexels-marta-dzedyshko-2067396.jpg&fm=jpg',
      },
      {
        'name': 'Classic Tiramisu',
        'id': 3,
        'picture':
            'https://images.pexels.com/photos/5205441/pexels-photo-5205441.jpeg?cs=srgb&dl=pexels-marina-abrosimova-5205441.jpg&fm=jpg',
      },
      {
        'name': 'Pavlova',
        'id': 4,
        'picture':
            'https://images.pexels.com/photos/5682480/pexels-photo-5682480.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      },
    ];

    List<dynamic> cart = [];

    return MaterialApp(
      title: 'Boring Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Boring Shop', items: items, cart: cart),
    );
  }
}

class MyHomePage extends HookWidget {
  MyHomePage({Key key, this.title, items, this.cart}) : super(key: key) {
    myItems = Items(items);
  }

  final String title;
  Items myItems;
  final List<dynamic> cart;

  @override
  Widget build(BuildContext context) {
    var thumbnailSize = MediaQuery.of(context).size.width * 0.2;
    var itemsPerRow = 4;
    var myCart = useState(cart);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            GestureDetector(
                key: Key("checkout"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CheckOutPage(cart: myCart.value)),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 60, 0),
                  child: Text("Cart: " + myCart.value.length.toString()),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                for (int i = 0; i < myItems.totalNumberOfRows(); i++)
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    for (int j = 0; j < myItems.totalNumberOfItemOnRow(i); j++)
                      Container(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsPage(
                                        cart: cart, item: myItems.item(i, j))),
                              ).then((toAdd) {
                                if (toAdd) cart.add(myItems.item(i, j));
                                myCart.value = []..addAll(cart);
                              });
                            },
                            key: Key(myItems.key(i, j)),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: thumbnailSize,
                                      height: thumbnailSize,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  thumbnailSize / 2)),
                                          child: Image(
                                              image: NetworkImage(myItems.item(
                                                  i, j)['picture']),
                                              fit: BoxFit.cover)),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 8.0)),
                                    Text(myItems.item(i, j)['name']),
                                  ],
                                ))),
                      )
                  ]),
              ],
            ),
          )),
        ));
  }
}
