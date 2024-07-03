import 'package:deshi_mart/configs/Colors.dart';
import 'package:deshi_mart/models/Product.dart';
import 'package:deshi_mart/widgets/MyIconButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../const/data.dart';
import '../../../providers/AddProductProvider.dart';

class ProductsTableData extends StatelessWidget {
  const ProductsTableData({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<AddProductProvider>(context);
    final productDataSource = ProductDataSource(productProvider.products);
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
            child: Image.network(cell.value[0] ??
                "data:image/jpeg;base64,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uyXscerHLPK+Wj1b18Ls7ekbanYDobKD3InjG6eOu4bxKnnALRA57fIgdFfRu4tPkQm8uqPjbR4Rvt+yg+Z9Mp/CvQysEifhk4p6TFD96WlEAHfNI0n5BpU4vR+JrV4Z50l0lf5J/k8Ub3U1LzKh7GsebgWsXfFZazWSPk/E6yxONq1Vs37afYNLMRcY5wRGNRGQW5j39Fn/AOa03NL4USYIDCQGyyOjtox5zZfQ7quU83Ii2mbgHPmiihjMtRKcscbRdzz2CzCEp6IzGLm8qPpvBfC4wVjq2tAkxKZoa43uIWb5G/HUnc/ALp06Spqx1aNFU14nVKwvCAIAgCAIAgCAIAgOe4zwmHEMMfUyuqQ+ijkljZA8NLyG3sbg72VValCrHLPYlGrOk80HZnyehw7DpI456l76uRwDi6Z+ZvwA0+a89VxNZNxhaK8DuUMFQlFVJtzb6v7FwySnjbZjWtA6NH/paTzvVtnTjlirR2NULqemDxGCWudmDbaC+4H6qUs07X5FdOMKd1HZswayNt8oaCSSczhusNZt2SU4rYxQ45SUNS+OrqImRzuDgQ73Xba+RXUw13DI1scHHqmqnaJ7nb01dSPpmSMqoXMtuJApuMlyNVSXU5PjfjSjp8MqMKwqdlRUzjJK9hu2NvUX6krboUnzNWtiYx0WpwUFQ1zBa9vPdVTg4to+j4HH0sXRVSn6+fibmva7YqFmbsZxlsyNW1TImZGkZ3eewV9Glmd3sec4/wAYhh6LoUn35aeSej9ehqhxfJLzZYY5pejnP93yA2CvlRzKydkfOXFbInR45VTvAjoC7+xrnn+FD+lXUdidjwpw3ivEMT5Z3Ow6AHUywEyPB/CLAD43WY4Rc2XU8Lm3Z9I4f4Yw7AWE0cbpKh4HMqZnZpH28+g8hYLajGMdjep0o01aJdqRYEAQBAEAQBAEAQBAEB5c3NZAUcnB3D0sjpH4TS5nG5ystc/BQdKD3igm0rJmBwZw6NsKp/iFHsaf/VfIlnn1fzNjOE8AZq3CKMEdeWE7GC5L5Byk92TI8Gw2IfV0FM30jCsStsQavuJMGw2UkvoKV1+8Q/hZFkRJeFMBl+0wehdfe8ISyI5I9DV/orhn/cOHdvsG/wALFkOzh0Mf6K4Z6YFh3/YCw4Re6LKcpU/gdvLQ9Dg3hsbYHQD/AJITJHoZU5q9m/mbY+FcAjN2YPQtPlCFmyKsi6EqPBsMj+zw+lb6RBZJZUSY6aGL7OGNn9rQEFkbMp7oZPSAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAID//Z"),
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
