import 'package:deshi_mart/models/Category.dart';
import 'package:deshi_mart/models/SubCategory.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SubCategorySearchDropDownButton extends StatefulWidget {
  final List<SubCategory> items;
  final ValueChanged<SubCategory?> selectedValue;
  final String hintText;

  const SubCategorySearchDropDownButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.hintText,
  });

  @override
  State<SubCategorySearchDropDownButton> createState() =>
      _SubCategorySearchDropDownButtonState();
}

class _SubCategorySearchDropDownButtonState
    extends State<SubCategorySearchDropDownButton> {
  SubCategory? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode textFocusNode = FocusNode(); // Add this line

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textFocusNode.hasFocus;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
    textFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<SubCategory>(
          focusNode: textFocusNode,
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: widget.items
              .map((category) => DropdownMenuItem(
                    value: category!,
                    child: Text(
                      category.title!,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            widget.selectedValue(value);
            textFocusNode.requestFocus();
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 300,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Search for an item...',
                  hintStyle: const TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value
                  .toString()
                  .toLowerCase()
                  .contains(searchValue.toLowerCase());
            },
          ),
          // This to clear the search value when you close the menu
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }
}