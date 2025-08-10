import 'package:flutter/material.dart';

class AddListProduct extends StatelessWidget {
  const AddListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Produto à Lista')),
      body: const Center(child: Text('Formulário de Adição de Produto')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
