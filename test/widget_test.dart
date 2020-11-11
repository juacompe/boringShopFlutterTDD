// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:boringshop/main.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MyTestApp extends StatelessWidget {
  List<dynamic> items = [
    {
      'name': 'google glass',
      'id': 0,
      'picture': 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png'
    },
    {
      'name': 'rotary phone',
      'id': 1,
      'picture': 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Alt_Telefon.jpg/440px-Alt_Telefon.jpg'
    },
  ];

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

void main() {
  testWidgets('click an item and back to main', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MyTestApp());

      expect(find.byKey(Key('item1')), findsOneWidget);
      expect(find.byKey(Key('item2')), findsOneWidget);

      await tester.tap(find.byKey(Key('item2')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('Product Details')), findsOneWidget);

      await tester.tap(find.byKey(Key('back')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('item2')), findsOneWidget);
    });
  });

  testWidgets('select an item and put in into shopping cart', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MyTestApp());
      await tester.tap(find.byKey(Key('item2')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('item2details')));
      await tester.tap(find.byKey(Key('back')));
      await tester.pumpAndSettle();

      expect(find.text("Cart: 1"), findsOneWidget);
    });
  });
}
