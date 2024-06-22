import 'package:deshi_mart/configs/CustomNotication.dart';
import 'package:deshi_mart/pages/Product/Widgets/ProductAmount.dart';
import 'package:deshi_mart/pages/Product/Widgets/ProductDetails.dart';
import 'package:deshi_mart/pages/Product/Widgets/ProductMeta.dart';
import 'package:deshi_mart/widgets/MyIconButton.dart';
import 'package:deshi_mart/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../providers/AddProductProvider.dart';
import '../../widgets/ResponsiveLayout.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final _stringTagController = StringTagController();
    final addProductProvider = Provider.of<AddProductProvider>(context);
    bool isDesktop = Responsive.isDesktop(context);
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
                  Consumer<AddProductProvider>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? CircularProgressIndicator()
                          : PrimaryButton(
                              name: "Save",
                              icon: Icons.save,
                              onTap: () {
                                addProductProvider.addProduct(context);
                              },
                              color: Colors.green);
                    },
                  ),
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
              isDesktop
                  ? const Row(
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
                    )
                  : const Column(
                      children: [
                        ProductDetails(),
                        SizedBox(height: 20),
                        ProductMeta(),
                      ],
                    ),
              SizedBox(height: 20),
              ProductAmount(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: isDesktop
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                      name: "Close",
                      icon: Icons.close,
                      onTap: () {
                        context.pop();
                        // successMessage(context, "Product Added Successfully");
                      },
                      color: Colors.red),
                  SizedBox(width: 20),
                  Consumer<AddProductProvider>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? CircularProgressIndicator()
                          : PrimaryButton(
                              name: "Save",
                              icon: Icons.save,
                              onTap: () {
                                addProductProvider.addProduct(context);
                              },
                              color: Colors.green);
                    },
                  ),
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
