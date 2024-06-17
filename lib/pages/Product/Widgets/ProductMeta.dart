import 'dart:io';
import 'dart:js_interop';

import 'package:deshi_mart/providers/AddProductService.dart';
import 'package:deshi_mart/providers/ImagePicker.dart';
import 'package:deshi_mart/widgets/HoverEffect.dart';
import 'package:deshi_mart/widgets/MyDropDownButton.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../const/Values.dart';

class ProductMeta extends StatelessWidget {
  const ProductMeta({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var unitType = [
      "Length",
      "Weight",
      "Volume",
      "Area",
      "Temperature",
      "Time",
      "Electric Current",
      "Luminous Intensity",
      "Amount of Substance",
      "Pressure",
      "Energy",
      "Power",
      "Frequency"
    ];
    var unit = [
      "meter (m)",
      "centimeter (cm)",
      "millimeter (mm)",
      "kilometer (km)",
      "inch (in)",
      "foot (ft)",
      "yard (yd)",
      "mile (mi)",
      "gram (g)",
      "kilogram (kg)",
      "milligram (mg)",
      "metric ton (t)",
      "ounce (oz)",
      "pound (lb)",
      "stone (st)",
      "ton",
      "liter (L)",
      "milliliter (mL)",
      "cubic meter (m³)",
      "cubic centimeter (cm³)",
      "fluid ounce (fl oz)",
      "pint (pt)",
      "quart (qt)",
      "gallon (gal)",
      "cubic inch (in³)",
      "cubic foot (ft³)",
      "square meter (m²)",
      "square centimeter (cm²)",
      "hectare (ha)",
      "square kilometer (km²)",
      "square inch (in²)",
      "square foot (ft²)",
      "square yard (yd²)",
      "acre",
      "square mile (mi²)",
      "degrees Celsius (°C)",
      "degrees Fahrenheit (°F)",
      "Kelvin (K)",
      "second (s)",
      "minute (min)",
      "hour (h)",
      "day",
      "year",
      "ampere (A)",
      "candela (cd)",
      "mole (mol)",
      "pascal (Pa)",
      "bar (bar)",
      "atmosphere (atm)",
      "pounds per square inch (psi)",
      "joule (J)",
      "calorie (cal)",
      "kilowatt-hour (kWh)",
      "British Thermal Unit (BTU)",
      "watt (W)",
      "horsepower (hp)",
      "hertz (Hz)"
    ];
    final imageProviderService = Provider.of<ImagePickerService>(context);
    final addProductService = Provider.of<AddProductService>(context);
    TextEditingController stockController = TextEditingController();
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
                    Icon(Icons.edit_document),
                    SizedBox(width: 10),
                    Text('Meta Details'),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.1),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Product Images',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    imageProviderService.pickImage(ImageSource.gallery);
                    addProductService.images = imageProviderService.images;
                  },
                  child: DottedBorder(
                      radius: Radius.circular(20),
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.1),
                      strokeWidth: 1,
                      dashPattern: [5, 7],
                      child: HoverEffect(builder: (isHover) {
                        return AnimatedContainer(
                          duration: DefaultValue.animationDuration,
                          decoration: BoxDecoration(
                            color: isHover
                                ? Theme.of(context).colorScheme.background
                                : Colors.transparent,
                          ),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Click here to Upload Image',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      })),
                ),
                SizedBox(height: 20),
                DottedBorder(
                    radius: Radius.circular(20),
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.1),
                    strokeWidth: 1,
                    dashPattern: [5, 7],
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 100,
                      child: Consumer<ImagePickerService>(
                        builder: (context, imageProviderService, child) {
                          return imageProviderService.images.isNotEmpty
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: imageProviderService.images
                                      .map((e) =>
                                          HoverEffect(builder: (isHover) {
                                            return Stack(
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onBackground
                                                        .withOpacity(0.2),
                                                  ),
                                                  child: Image.network(
                                                    e,
                                                  ),
                                                ),
                                                isHover
                                                    ? Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: InkWell(
                                                          onTap: () {
                                                            imageProviderService
                                                                .removeImage(e);
                                                          },
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.6),
                                                            ),
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Colors.red,
                                                              size: 10,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Container()
                                              ],
                                            );
                                          }))
                                      .toList(),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'No image',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    )
                                  ],
                                );
                        },
                      ),
                    )),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Stock',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: addProductService.stockController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Stock"),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Stock is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Unit Type',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SearchDropDownButton(
                            items: unitType,
                            selectedValue: (unit) {
                              addProductService.selectedUnitType = unit ?? "";
                            },
                            hintText: "Select Unit Type",
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Unit name',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SearchDropDownButton(
                            items: unit,
                            selectedValue: (unit) {
                              addProductService.selectedUnit = unit ?? "";
                            },
                            hintText: "Select Unit",
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
