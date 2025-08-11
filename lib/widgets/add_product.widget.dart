import 'package:flutter/material.dart';
import 'package:lista_de_compras/models/product.model.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  addProduct() {
    if (!formKey.currentState!.validate()) return;

    final product = Product(
      name: nameController.text,
      price: double.tryParse(priceController.text) ?? 0,
    );

    Navigator.of(context).pop(product);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Adicionar Item',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            TextFormField(
              key: ValueKey('inputItem'),
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo é obrigatório.';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Nome do item',
                border: InputBorder.none,
              ),
            ),
            TextFormField(
              key: ValueKey('inputValue'),
              controller: priceController,
              decoration: InputDecoration(
                hintText: 'R\$ 0,00',
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  key: ValueKey('addItemBtn'),
                  onPressed: addProduct,
                  child: Text(
                    'Adicionar',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
