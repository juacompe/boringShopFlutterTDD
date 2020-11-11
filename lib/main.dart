import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<dynamic> items = [];
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: GestureDetector(
                onTap: () {
                },
                key: Key('item1'),
                child: Text(items[0]['name'])
              ),
            )
          ],
        ),
      ),
    );
  }
}
