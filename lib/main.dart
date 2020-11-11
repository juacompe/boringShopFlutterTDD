
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'ProductDetailsPage.dart';

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
        'picture': 'https://images.pexels.com/photos/1070850/pexels-photo-1070850.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1070850.jpg&fm=jpg',
      },
      {
        'name': 'Lovely cupcake',
        'id': 1,
        'picture': 'https://images.pexels.com/photos/913136/pexels-photo-913136.jpeg?cs=srgb&dl=pexels-jess-bailey-designs-913136.jpg&fm=jpg',
      },
      {
        'name': 'Brownie with rice',
        'id': 2,
        'picture': 'https://images.pexels.com/photos/2067396/pexels-photo-2067396.jpeg?cs=srgb&dl=pexels-marta-dzedyshko-2067396.jpg&fm=jpg',
      },
      {
        'name': 'Classic Tiramisu',
        'id': 3,
        'picture': 'https://images.pexels.com/photos/5205441/pexels-photo-5205441.jpeg?cs=srgb&dl=pexels-marina-abrosimova-5205441.jpg&fm=jpg',
      },
      {
        'name': 'Pavlova',
        'id': 4,
        'picture': 'https://images.pexels.com/photos/5682480/pexels-photo-5682480.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
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
  MyHomePage({Key key, this.title, this.items, this.cart}) : super(key: key);

  final String title;
  final List<dynamic> items;
  final List<dynamic> cart;

  @override
  Widget build(BuildContext context) {
    var thumbnailSize = MediaQuery.of(context).size.width * 0.2;
    var itemsPerRow = 4;
    var myCart = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 60, 0),
            child: Text("Cart: " + myCart.value.toString()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                for (int i = 0; i < (items.length / itemsPerRow).ceil(); i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(int j = 0; j < (i + 1 == (items.length / itemsPerRow).ceil() ? items.length % itemsPerRow : itemsPerRow); j++)
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(cart: cart, item: items[(i * itemsPerRow) + j])),
                              ).then((toAdd) {
                                if (toAdd) cart.add(items[(i * itemsPerRow) + j]);
                                myCart.value = cart.length;
                              });
                            },
                            key: Key('item${(i * itemsPerRow) + j + 1}'),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: thumbnailSize,
                                    height: thumbnailSize,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(thumbnailSize / 2)),
                                      child: Image(image: NetworkImage(items[(i * itemsPerRow) + j]['picture']), fit: BoxFit.cover)
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 8.0)),
                                  Text(items[(i * itemsPerRow) + j]['name']),
                                ],
                              )
                            )
                          ),
                        )
                    ]
                  ),
              ],
            ),
          )
        ),
      )
    );
  }
}
