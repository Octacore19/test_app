class Item {
  const Item({
    required this.title,
    required this.amount,
    required this.itemCount,
    this.image = 'assets/img.png',
  });

  final String title;
  final String image;
  final String amount;
  final int itemCount;

  static List<Item> get generate {
    return [
      const Item(title: 'Gold', amount: '9,000', itemCount: 9),
      const Item(title: 'Diamond', amount: '10,000', itemCount: 20),
      const Item(title: 'Silver', amount: '20,000', itemCount: 20),
    ];
  }
}
