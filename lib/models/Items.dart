class Items {
  final List<dynamic> items;
  final itemsPerRow = 4;

  Items(this.items);

  num totalNumberOfRows() {
    return (items.length / itemsPerRow).ceil();
  }
}
