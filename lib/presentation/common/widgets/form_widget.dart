import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mca_project/data/models/category/product_category/product_category.dart';
import '../../../utils/image_picker.dart';
import '/utils/extensions/form_validation.dart';

enum FormType { login, register, forgotpassword }

enum UserType { customer, shop }

class FormWidget extends StatefulWidget {
  final UserType userType;
  final void Function(
    Map<String, dynamic>? otherShopDetails, {
    required String email,
    required String password,
    required String username,
  }) registerCallback;
  final void Function({required String email, required String password})
      loginCallback;
  const FormWidget({
    super.key,
    required this.registerCallback,
    required this.loginCallback,
    required this.userType,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<_OtherShopDetailsWidgetState> _childKey =
      GlobalKey<_OtherShopDetailsWidgetState>();
  FormType currentForm = FormType.login;
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  String _email = "";
  String _password = "";
  String _username = "";
  int _mobile = 0;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          //only for large screens
          margin: deviceHeight > 700
              ? EdgeInsets.only(top: deviceHeight * 0.1)
              : null,
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (currentForm == FormType.register)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.userType == UserType.customer
                        ? "Username"
                        : "Shop Name"),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 10.0),
                        labelText: widget.userType == UserType.customer
                            ? "Username"
                            : "Shop Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || !value.isValidUsername()) {
                          return 'Please enter name in proper-format';
                        }
                        return null;
                      },
                      onSaved: (value) => _username = value!,
                    ),
                  ],
                ),
              SizedBox(height: 20.0),
              Text("Email"),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: currentForm == FormType.forgotpassword
                      ? 'Enter Registered Email'
                      : 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || !value.isValidEmail()) {
                    return 'Please enter valid email address';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!, // Update _email on save
              ),
              if (currentForm == FormType.register ||
                  currentForm == FormType.login)
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Password"),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      obscureText: true, // Hide password input
                      decoration: InputDecoration(
                        labelText: 'Enter Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (currentForm != FormType.register) {
                          return null;
                        }
                        if (value == null || !value.isValidPassword()) {
                          return 'Please enter strong password';
                        }
                        return null;
                      },
                      onSaved: (value) =>
                          _password = value!, // Update _password on save
                    ),
                    if (currentForm == FormType.login)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RichText(
                          text: TextSpan(
                              text: "Forgot Password?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    currentForm = FormType.forgotpassword;
                                  });
                                }),
                        ),
                      ),
                  ]),
                  SizedBox(height: 20.0),
                ]),
              SizedBox(height: 20.0),
              if (currentForm == FormType.register)
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Confirm Password"),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: true, // Hide password input
                    decoration: InputDecoration(
                      labelText: 'Enter same Password again',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter same password';
                      }
                      return null;
                    },
                    onSaved: (value) =>
                        _password = value!, // Update _password on save
                  ),
                  SizedBox(height: 20.0),
                ]),
              if (widget.userType == UserType.shop &&
                  currentForm == FormType.register)
                OtherShopDetailsWidget(
                  key: _childKey,
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(deviceWidth, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _childKey.currentState!.formKey.currentState!
                          .validate()) {
                    _formKey.currentState!.save();

                    if (currentForm == FormType.forgotpassword) {
                    } else if (currentForm == FormType.register) {
                      if (widget.userType == UserType.shop) {
                        final allImagesFilled =
                            _childKey.currentState?.checkImagesFilled();
                        if (allImagesFilled != true) {
                          return;
                        }
                      }
                      widget.registerCallback(
                        widget.userType == UserType.customer
                            ? {}
                            : _childKey.currentState!.getOtherShopDetails(),
                        email: _email,
                        password: _password,
                        username: _username,
                      );
                    } else {
                      widget.loginCallback(email: _email, password: _password);
                    }
                  }
                },
                child: Text(
                  currentForm == FormType.login
                      ? 'Login'
                      : currentForm == FormType.forgotpassword
                          ? 'Submit'
                          : 'Register',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: currentForm == FormType.login ||
                              currentForm == FormType.forgotpassword
                          ? 'Don\'t have an account? '
                          : "Already have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      // style: defaultStyle,
                    ),
                    TextSpan(
                        text: currentForm == FormType.login ||
                                currentForm == FormType.forgotpassword
                            ? 'Register Here'
                            : 'Login Here',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              currentForm = currentForm == FormType.login
                                  ? FormType.register
                                  : FormType.login;
                            });
                          }),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherShopDetailsWidget extends StatefulWidget {
  const OtherShopDetailsWidget({
    super.key,
  });

  @override
  State<OtherShopDetailsWidget> createState() => _OtherShopDetailsWidgetState();
}

class _OtherShopDetailsWidgetState extends State<OtherShopDetailsWidget> {
  String? ownerName;
  XFile? _shopPic;
  XFile? _ownerPic;
  XFile? _pancardPic;
  XFile? _ownerIdPic;
  String? locationName;
  String? businessLicense;
  int? phoneNumber;
  List<ProductCategory>? selectedCategories;
  ImagePicker? _picker;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checkImagesFilled() {
    if (_shopPic == null ||
        _ownerPic == null ||
        _pancardPic == null ||
        _ownerIdPic == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please upload all images'),
      ));
      return false;
    }
    return true;
  }

  Map<String, dynamic> getOtherShopDetails() {
    return {
      'ownerName': ownerName!,
      'shopPic': _shopPic!.path,
      'ownerPic': _ownerPic!.path,
      'pancardPic': _pancardPic!.path,
      'ownerIdPic': _ownerIdPic!.path,
      'locationName': locationName!,
      'businessLicense': businessLicense!,
      'phoneNumber': phoneNumber!.toString(),
      'categories': selectedCategories!,
    };
  }

  Future<void> _getImage(XFile? imageToSet) async {
    final image = await getImage(_picker!);

    if (image != null) {
      setState(() {
        imageToSet = image;
      });
    } else {
      return;
    }
  }

  @override
  void initState() {
    _picker = ImagePicker();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    return Form(
        key: formKey,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _getImage(_shopPic);
              },
              child: _shopPic == null
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
                            Text('Select Main Image **'),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: 200.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: kIsWeb
                            ? Image.network(_shopPic!.path)
                            : Image.file(File(_shopPic!.path)),
                      ),
                    ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Business License Number"),
              TextFormField(
                textInputAction: TextInputAction.next,
                obscureText: true, // Hide password input
                decoration: InputDecoration(
                  labelText: 'Enter Proper Business License Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid Business License Number';
                  }
                  return null;
                },
                onSaved: (value) =>
                    businessLicense = value, // Update _password on save
              ),
              SizedBox(height: 20.0),
            ]),
          ],
        ));
  }
}
