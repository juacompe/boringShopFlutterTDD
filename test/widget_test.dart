// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:boringshop/main.dart';

void main() {
  testWidgets('select an item and put in into shopping cart', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byKey(Key('item1')), findsOneWidget);
  });
}
