import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mca_project/utils/extensions/form_validation.dart';

enum FormType { login, register, forgotpassword }

class FormWidget extends StatefulWidget {
  final void Function(
      {required String email,
      required String password,
      required String username}) registerCallback;
  final void Function({required String email, required String password})
      loginCallback;
  const FormWidget(
      {super.key, required this.registerCallback, required this.loginCallback});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  FormType currentForm = FormType.login;
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  String _email = "";
  String _password = "";
  String _username = "";
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (currentForm == FormType.register)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username"),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || !value.isValidUsername()) {
                          return 'Please enter username in proper-format';
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
              SizedBox(height: 20.0),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(deviceWidth, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    if (currentForm == FormType.forgotpassword) {
                    } else if (currentForm == FormType.register) {
                      widget.registerCallback(
                          email: _email,
                          password: _password,
                          username: _username);
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
