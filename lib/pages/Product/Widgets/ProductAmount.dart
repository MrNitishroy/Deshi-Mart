import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductAmount extends StatelessWidget {
  const ProductAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.currency_rupee_rounded),
                    SizedBox(width: 10),
                    Text('Amount'),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.1),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Purchase Price',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: "Amount"),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ],
                    )),
                    SizedBox(width: 20),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Sell Price',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: "Amount"),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ],
                    )),
                    SizedBox(width: 20),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Discount',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: "Amount"),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Purchase Price',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Enter Tags",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
