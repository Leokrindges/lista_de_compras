import 'package:flutter/material.dart';
import 'package:lista_de_compras/models/product.model.dart';
import 'package:lista_de_compras/widgets/add_product.widget.dart';

class AddListProduct extends StatefulWidget {
  final List<Product> products;

  const AddListProduct({super.key, required this.products});

  @override
  State<AddListProduct> createState() => _AddListProductState();
}

class _AddListProductState extends State<AddListProduct> {
  double calcTotalChecked() {
    return widget.products
        .where((product) => product.isChecked)
        .fold(0.0, (sum, product) => sum + product.price);
  }

  double calcTotalUnchecked() {
    return widget.products
        .where((product) => !product.isChecked)
        .fold(0.0, (sum, product) => sum + product.price);
  }

  void addProduct() async {
    final newProduct = await showModalBottomSheet<Product>(
      context: context,
      builder: (ctx) => AddProduct(),
    );

    if (newProduct != null) {
      setState(() {
        widget.products.add(newProduct);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              key: ValueKey('updateListBtn'),
              onTap: () {},
              child: Text(
                'Atualizar',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mercado',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Divider(color: Colors.grey, thickness: 1),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.products.length,
                itemBuilder: (ctx, index) {
                  final product = widget.products[index];
                  return Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          key: ValueKey('productCheckbox'),
                          value: product.isChecked,
                          onChanged: (value) {
                            setState(() {
                              product.isChecked = value!;
                            });
                          },
                          shape: CircleBorder(),
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          side: BorderSide(color: Colors.blue),
                        ),
                      ),
                      Text(
                        product.name,
                        style: TextStyle(
                          color: product.isChecked ? Colors.grey : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'R\$ ${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Não Marcados'),
                      Text(
                        'R\$ ${calcTotalUnchecked().toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Text('Marcados'),
                      Text(
                        'R\$ ${calcTotalChecked().toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: ValueKey('addNewItemBtn'),
        onPressed: addProduct,
        label: const Text('Adicionar'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
