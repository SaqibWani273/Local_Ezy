import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mca_project/data/models/category/category_data.dart';
import 'package:mca_project/data/repositories/shop/shop_data_repository.dart';

import '../../../../utils/image_picker.dart';
import 'view_model/shop_bloc.dart';

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({super.key});

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  late List<String> _formFields;
  List<TextEditingController> _formControllers = [];
  XFile? _mainProductImage;
  List<XFile>? _moreProductImages = [];
  CategoryData? _selectedCategory;
  void initState() {
    context.read<ShopBloc>().add(LoadAllCategoriesEvent());

    _formFields = [
      "name",
      "brand",
      "shortDescription",
      "completeDescription",
      "price",
      "stockQuantity",
      "sku"
    ];
    for (var i = 0; i < _formFields.length; i++) {
      _formControllers.add(TextEditingController());
    }

    _picker = ImagePicker();
    super.initState();
  }

  ImagePicker? _picker;

  Future<void> _getImage() async {
    final image = await getImage(_picker!);

    if (image != null) {
      setState(() {
        _mainProductImage = image;
      });
    } else {
      return;
    }
  }

  Future<void> _getMoreImages() async {
    final image = await getImage(_picker!);
    if (image != null) {
      setState(() {
        _moreProductImages!.add(image);
      });
    }
  }

  void _changeSelectedCategory(CategoryData? category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          if (state is ShopLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ShopUploadedProductState) {
            return const Center(
              child: Text('Product Uploaded'),
            );
          }
          if (state is ShopLoadedAllCategoriesState) {
            var deviceHeight = MediaQuery.of(context).size.height;
            var deviceWidth = MediaQuery.of(context).size.width;
            final List<CategoryData> categories =
                context.read<ShopDataRepository>().categoriesData;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _getImage,
                      //  () async {
                      //   await _getImage();
                      // },
                      child: _mainProductImage == null
                          ? Container(
                              height: deviceHeight * 0.2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image),
                                    Text('Select Main Image'),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              height: 200.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: kIsWeb
                                    ? Image.network(_mainProductImage!.path)
                                    : Image.file(File(_mainProductImage!.path)),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ElevatedButton.icon(
                              icon: Icon(Icons.image),
                              onPressed: _getMoreImages,
                              label: Text("add another")),
                          ..._moreProductImages!
                              .map(
                                (e) => Container(
                                  height: 50.0,
                                  width: deviceWidth * 0.2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: kIsWeb
                                        ? Image.network(e.path)
                                        : Image.file(File(e.path)),
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ..._formFields
                        .map(
                          (e) => Column(
                            children: [
                              TextFormField(
                                controller:
                                    _formControllers[_formFields.indexOf(e)],
                                decoration: inputDec(e),
                                keyboardType:
                                    e == 'price' || e == 'stockQuantity'
                                        ? TextInputType.number
                                        : null,
                                validator: productFieldValidator,
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                        )
                        .toList(),
                    DropdownButtonFormField<CategoryData?>(
                      value: null, //categories[0].name,
                      items: categories
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                      onChanged: _changeSelectedCategory,
                      decoration:
                          InputDecoration(labelText: 'Select a category'),
                    ),
                    if (_selectedCategory != null)
                      Column(children: [
                        if (_selectedCategory!.mustFields != null)
                          //string fields
                          if (_selectedCategory!.mustFields!.stringAttributes !=
                                  null &&
                              _selectedCategory!
                                  .mustFields!.stringAttributes!.isNotEmpty)
                            ..._selectedCategory!.mustFields!.stringAttributes!
                                .map(
                                  (e) => Column(
                                    children: [
                                      TextFormField(
                                        // controller:
                                        //     _formControllers[_formFields.indexOf(e)],
                                        decoration: inputDec(e),
                                        keyboardType:
                                            e == 'price' || e == 'stockQuantity'
                                                ? TextInputType.number
                                                : null,
                                        validator: productFieldValidator,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                )
                                .toList(),
                      ]),

                    SizedBox(height: 40),
                    // Submit button
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Upload Category'),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator(), Text("  !!!")],
          ));
        },
      ),
    ));
  }
}

String? productFieldValidator(String? value) {
  if (value == null || value.length < 2) {
    return 'enter a valid field value';
  }
  return null;
}

InputDecoration inputDec(String label) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.grey[200],
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10.0),
    ),
    labelText: label,
  );
}
