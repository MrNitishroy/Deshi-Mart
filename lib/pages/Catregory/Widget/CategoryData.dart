import 'package:deshi_mart/configs/AssetsPath.dart';
import 'package:deshi_mart/configs/Colors.dart';
import 'package:deshi_mart/models/Category.dart';
import 'package:deshi_mart/models/Product.dart';
import 'package:deshi_mart/providers/CategoryProvider.dart';
import 'package:deshi_mart/widgets/MyIconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../const/data.dart';

class CategoryDataTable extends StatelessWidget {
  const CategoryDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categoryDataSource = CategoryDataSource(categoryProvider.categories);
    return Container(
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.all(10),
      child: SfDataGrid(
          rowHeight: 100,
          source: categoryDataSource,
          allowFiltering: true,
          allowSorting: true,
          headerGridLinesVisibility: GridLinesVisibility.none,
          gridLinesVisibility: GridLinesVisibility.none,
          columns: [
            GridColumn(
                allowFiltering: false,
                width: 200,
                columnName: "id",
                label: Container(
                  child: Center(child: Text("ID")),
                )),
            GridColumn(
                allowFiltering: false,
                allowSorting: true,
                width: 200,
                columnName: "image",
                label: Container(
                  child: Center(child: Text("Image")),
                )),
            GridColumn(
                allowFiltering: false,
                allowSorting: true,
                width: 300,
                columnName: "title",
                label: Container(
                  child: Center(child: Text("Category Name")),
                )),
            GridColumn(
                allowFiltering: false,
                allowSorting: true,
                width: 400,
                columnName: "subCategory",
                label: Container(
                  child: Center(child: Text("Sub Category")),
                )),
            GridColumn(
                width: 200,
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

class CategoryDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRows;

  CategoryDataSource(List<Category> products) {
    dataGridRows = products
        .map((category) => DataGridRow(cells: [
              DataGridCell(columnName: "id", value: category.id),
              DataGridCell(columnName: "image", value: category.coverUrl),
              DataGridCell(columnName: "title", value: category.title),
              DataGridCell(
                  columnName: "subCategory", value: category.subCategories),
              DataGridCell(columnName: "action", value: category.id),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        if (cell.columnName == "image") {
          return cell.value == null
              ? Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.withOpacity(0.2),
                  ),
                  child: SizedBox(
                    child: SvgPicture.asset(
                      IconsAssets.box,
                      width: 30,
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.withOpacity(0.2),
                  ),
                  child: Image.network(cell.value),
                );
        }

        if (cell.columnName == "action") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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