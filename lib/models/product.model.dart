class Product {
  String name;
  double price;
  bool isChecked;

  Product({required this.name, required this.price}) : isChecked = false;

  changeChecked(bool isChecked) {
    this.isChecked = isChecked;
  }
}
