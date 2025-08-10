import 'package:flutter/material.dart';
import 'package:lista_de_compras/models/product.model.dart';

class AddListProduct extends StatefulWidget {
  const AddListProduct({super.key});

  @override
  State<AddListProduct> createState() => _AddListProductState();
}

class _AddListProductState extends State<AddListProduct> {
  final List<Product> products = [
    Product(name: 'Arroz', price: 5.00),
    Product(name: 'Feijão', price: 4.50),
    Product(name: 'Macarrão', price: 3.00),
    Product(name: 'Óleo', price: 6.00),
    Product(name: 'Açúcar', price: 2.50),
    Product(name: 'Sal', price: 1.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Atualizar',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
                itemCount: products.length,
                itemBuilder: (ctx, index) {
                  final product = products[index];
                  return Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
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
                        'R\$ ${product.price}',
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
                        'R\$ 0.00',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Text('Marcados'),
                      Text(
                        'R\$ 0.00',
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
        onPressed: () {},
        label: const Text('Adicionar'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
