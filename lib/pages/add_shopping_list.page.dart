import 'package:flutter/material.dart';
import 'package:lista_de_compras/widgets/custom_button.dart';

class AddShoppingListPage extends StatefulWidget {
  const AddShoppingListPage({super.key});

  @override
  State<AddShoppingListPage> createState() => _AddShoppingListPageState();
}

class _AddShoppingListPageState extends State<AddShoppingListPage> {
  final nome = TextEditingController();

  final formKey = GlobalKey<FormState>();

  addShopping() {
    if (!formKey.currentState!.validate()) return;

    Navigator.of(context).pop(nome.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                TextFormField(
                  controller: nome,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo é obrigatório.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome da lista',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: Row(
                    children: [
                      CustomButton(
                        text: 'Voltar',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        height: 40,
                      ),
                      SizedBox(width: 16),
                      CustomButton(
                        text: 'Criar',
                        onTap: () {
                          addShopping();
                        },
                        height: 40,
                        backgroundColor: Colors.white,
                        textColor: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
