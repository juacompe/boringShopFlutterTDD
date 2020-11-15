import 'package:boringshop/models/Items.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('there 4 items per row', () {
    var items = Items([1, 2, 3, 4]);
    expect(items.totalNumberOfRows(), 1);
  });

  test('there 2 rows for 5 - 7 items', () {
    var items = Items([1, 2, 3, 4, 5]);
    expect(items.totalNumberOfRows(), 2);
  });

  test('there 0 rows for 0 items', () {
    var items = Items([]);
    expect(items.totalNumberOfRows(), 0);
  });
}
