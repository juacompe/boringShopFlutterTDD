import 'package:boringshop/models/Items.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('totalNumberOfRows', () {
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
  });

  group('totalNumberOfItemOnRow', () {
    test('1st row', () {
      var items = Items([1, 2, 3, 4, 5]);
      expect(items.totalNumberOfItemOnRow(0), 4);
    });

    test('2nd row', () {
      var items = Items([1, 2, 3, 4, 5]);
      expect(items.totalNumberOfItemOnRow(1), 1);
    });
  });
  group('item', () {
    test('index 0 of row 0 is 1st item', () {
      var items = Items([1]);
      const row = 0, index = 0;
      expect(items.item(row, index), 1);
    });

    test('index 0 of row 1 is 4', () {
      var items = Items([1, 2, 3, 4, 5]);
      const row = 1, index = 0;
      expect(items.item(row, index), 5);
    });
  });
  group('key', () {
    test('key starts with item0', () {
      var items = Items([1]);
      const row = 0, index = 0;
      expect(items.key(row, index), 'item1');
    });
  });
}
