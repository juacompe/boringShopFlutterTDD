class Items {
  final List<dynamic> items;
  final itemsPerRow = 4;

  Items(this.items);

  num totalNumberOfRows() {
    return (items.length / itemsPerRow).ceil();
  }

  num index(i, j) {
    return (i * itemsPerRow) + j;
  }

  String key(i, j) {
    return 'item${index(i, j) + 1}';
  }

  dynamic item(i, j) {
    return items[index(i, j)];
  }

  num totalNumberOfItemOnRow(int i) {
    return (i + 1 == totalNumberOfRows()
        ? items.length % itemsPerRow
        : itemsPerRow);
  }
}
