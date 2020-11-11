import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
        'picture' : 'https://images.pexels.com/photos/1070850/pexels-photo-1070850.jpeg?cs=srgb&dl=pexels-daria-shevtsova-1070850.jpg&fm=jpg',
      },
    ];

    return MaterialApp(
      title: 'Boring Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Boring Shop', items: items),
    );
  }
}

class MyHomePage extends HookWidget {
  MyHomePage({Key key, this.title, this.items}) : super(key: key);

  final String title;
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    var thumbnailSize = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              for (int i=0; i<items.length; i++)
              Container(
                width: thumbnailSize,
                child: GestureDetector(
                  onTap: () {},
                  key: Key('item${i+1}'),
                  child: Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(thumbnailSize / 2)),
                      child: Image(image: NetworkImage(items[i]['picture']), fit: BoxFit.cover)
                    ),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Text(items[i]['name']),
                  ],)
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
