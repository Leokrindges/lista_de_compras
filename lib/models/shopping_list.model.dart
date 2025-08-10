import 'package:lista_de_compras/models/product.model.dart';

class ShoppingList {
  String name;
  List<Product> products = [];

  ShoppingList({required this.name});
}
