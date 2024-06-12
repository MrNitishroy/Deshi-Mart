import 'package:deshi_mart/const/data.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 7,
              height: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 10),
            Text(
              "Product",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 30),
        DataTable(
            // columnSpacing: 20,
            dividerThickness: 0.1,
            showCheckboxColumn: true,
            headingRowColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.primary.withOpacity(0.2)),
            columns: [
              DataColumn(label: Text("Id"), numeric: false),
              DataColumn(label: Text("Name"), numeric: false),
              DataColumn(label: Text("Price")),
              DataColumn(label: Text("Unit")),
              DataColumn(label: Text("Stock")),
            ],
            rows: products
                .map((product) => DataRow(cells: [
                      DataCell(Text(product.id.toString())),
                      DataCell(Text(product.name.toString())),
                      DataCell(Text(product.sellPrice.toString())),
                      DataCell(Text(product.unit.toString())),
                      DataCell(Text(product.stock.toString())),
                    ]))
                .toList())
      ],
    );
  }
}
