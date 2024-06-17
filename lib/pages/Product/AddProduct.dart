import 'package:deshi_mart/pages/Product/Widgets/ProductAmount.dart';
import 'package:deshi_mart/pages/Product/Widgets/ProductDetails.dart';
import 'package:deshi_mart/pages/Product/Widgets/ProductMeta.dart';
import 'package:deshi_mart/widgets/MyIconButton.dart';
import 'package:deshi_mart/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final _stringTagController = StringTagController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text('Add Product'),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  PrimaryButton(
                      name: "Save",
                      icon: Icons.save,
                      onTap: () {},
                      color: Colors.green),
                  SizedBox(width: 20),
                  PrimaryButton(
                      name: "Close",
                      icon: Icons.close,
                      onTap: () {
                        context.pop();
                      },
                      color: Colors.red),
                  SizedBox(width: 20),
                ],
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProductDetails(),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProductMeta(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ProductAmount(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(
                      name: "Close",
                      icon: Icons.close,
                      onTap: () {
                        context.pop();
                      },
                      color: Colors.red),
                  SizedBox(width: 20),
                  PrimaryButton(
                      name: "Save",
                      icon: Icons.save,
                      onTap: () {},
                      color: Colors.green),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
