import 'package:flutter/material.dart';
import 'package:lista_de_compras/widgets/custom_button.dart';

class AddListPage extends StatelessWidget {
  const AddListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              TextField(
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
                      onTap: () {},
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
    );
  }
}
