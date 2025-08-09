import 'package:flutter/material.dart';
import 'package:lista_de_compras/models/shopping_list.model.dart';
import 'package:lista_de_compras/pages/add_list.page.dart';

class ShoppingListPage extends StatelessWidget {
  final List<ShoppingList> shoppingList = [
    // ShoppingList(name: 'Lista 1'),
    // ShoppingList(name: 'Lista 2'),
    // ShoppingList(name: 'Lista 3'),
  ];
  ShoppingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas listas'),
        centerTitle: true,
        actions: [
          Icon(Icons.diamond, color: Colors.yellow[700], size: 30),
          SizedBox(width: 16),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddListPage()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: shoppingList.isNotEmpty
            ? ListView.builder(
                itemCount: shoppingList.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  shoppingList[index].name,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "0/0",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            LinearProgressIndicator(
                              value: 0.0,
                              backgroundColor: Colors.grey,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/lista-de-compras.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 16),
                  Text('Crie sua primeira lista', textAlign: TextAlign.center),
                  Text('Toque no botão azul', textAlign: TextAlign.center),
                ],
              ),
      ),
    );
  }
}
