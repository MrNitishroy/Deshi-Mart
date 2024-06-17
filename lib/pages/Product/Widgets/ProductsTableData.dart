import 'package:deshi_mart/configs/Colors.dart';
import 'package:deshi_mart/models/Product.dart';
import 'package:deshi_mart/widgets/MyIconButton.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../const/data.dart';

class ProductsTableData extends StatelessWidget {
  const ProductsTableData({super.key});

  @override
  Widget build(BuildContext context) {
    final productDataSource = ProductDataSource(products);
    return Container(
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.all(10),
      child: SfDataGrid(
          rowHeight: 100,
          source: productDataSource,
          allowFiltering: true,
          allowSorting: true,
          headerGridLinesVisibility: GridLinesVisibility.none,
          gridLinesVisibility: GridLinesVisibility.none,
          columns: [
            GridColumn(
                allowFiltering: false,
                width: 100,
                columnName: "id",
                label: Container(
                  child: Center(child: Text("ID")),
                )),
            GridColumn(
                allowFiltering: false,
                allowSorting: true,
                width: 150,
                columnName: "images",
                label: Container(
                  child: Center(child: Text("Image")),
                )),
            GridColumn(
                allowFiltering: false,
                allowSorting: true,
                width: 150,
                columnName: "name",
                label: Container(
                  child: Center(child: Text("Name")),
                )),
            GridColumn(
                allowFiltering: false,
                width: 150,
                columnName: "sellPrice",
                label: Container(
                  child: Center(child: Text("S Price")),
                )),
            GridColumn(
                allowFiltering: false,
                width: 100,
                columnName: "stock",
                label: Container(
                  child: Center(child: Text("Stock")),
                )),
            GridColumn(
                width: 150,
                allowSorting: false,
                columnName: "supplier",
                label: Container(
                  child: Center(child: Text("Seller")),
                )),
            GridColumn(
                allowSorting: false,
                width: 100,
                columnName: "unit",
                label: Container(
                  child: Center(child: Text("Unit")),
                )),
            GridColumn(
                allowSorting: false,
                allowFiltering: false,
                width: 100,
                columnName: "purchasePrice",
                label: Container(
                  child: Center(child: Text("Price")),
                )),
            GridColumn(
                allowSorting: false,
                width: 150,
                columnName: "isActive",
                label: Container(
                  child: Center(child: Text("Active")),
                )),
            GridColumn(
                allowSorting: false,
                allowFiltering: false,
                columnName: "action",
                label: Container(
                  child: Center(child: Text("Action")),
                )),
          ]),
    );
  }
}

class ProductDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRows;

  ProductDataSource(List<Product> products) {
    dataGridRows = products
        .map((prodcut) => DataGridRow(cells: [
              DataGridCell(columnName: "id", value: prodcut.id),
              DataGridCell(columnName: "images", value: prodcut.images),
              DataGridCell(columnName: "name", value: prodcut.name),
              DataGridCell(columnName: "sellPrice", value: prodcut.sellPrice),
              DataGridCell(columnName: "stock", value: prodcut.stock),
              DataGridCell(columnName: "supplier", value: prodcut.supplier),
              DataGridCell(columnName: "unit", value: prodcut.unit),
              DataGridCell(
                  columnName: "purchasePrice", value: prodcut.purchasePrice),
              DataGridCell(columnName: "isActive", value: prodcut.isActive),
              DataGridCell(columnName: "action", value: prodcut.tags),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        if (cell.columnName == "images") {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green.withOpacity(0.2),
            ),
          );
        }
        if (cell.columnName == "isActive") {
          return Center(
            child: Text(
              cell.value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: cell.value == true ? Colors.green : Colors.red,
              ),
            ),
          );
        }

        if (cell.columnName == "action") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  MyIconButton(
                    icon: Icons.edit,
                    onTap: () {},
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  MyIconButton(
                    icon: Icons.delete,
                    onTap: () {},
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          );
        } else {
          return Center(
            child: Text(
              cell.value.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: onPrimaryContainerColor,
              ),
            ),
          );
        }
      }).toList(),
    );
  }
}
