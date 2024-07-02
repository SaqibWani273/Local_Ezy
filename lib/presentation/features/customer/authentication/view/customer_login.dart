import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mca_project/utils/functions/form_validation.dart';

import '../view_model/customer_auth_bloc.dart';

enum FormType { login, register, forgotpassword }

class CustomerLogin extends StatefulWidget {
  const CustomerLogin({super.key});

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  FormType currentForm = FormType.login;
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  String _email = "";
  String _password = "";
  String _username = "";
  @override
  void initState() {
    context.read<CustomerAuthBloc>().add(CustomerAuthInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<CustomerAuthBloc, CustomerAuthState>(
          listener: (context, state) {
        if (state is CustomerAuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        } else if (state is CustomerAuthLoggedInState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pop();
          });
        }
      }, builder: (context, state) {
        if (state is CustomerAuthLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CustomerAuthRegisteredState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.email, size: 60.0, color: Colors.blue),
                ),
                const Text(
                  'Verification Email Sent!',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    'A verification email has been sent to your address. Please check your inbox and click the link to verify your Email.',
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<CustomerAuthBloc>()
                        .add(CustomerAuthInitialEvent());
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          );
        }
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
                    onSaved: (value) =>
                        _email = value!, // Update _email on save
                  ),
                  SizedBox(height: 20.0),
                  if (currentForm == FormType.register ||
                      currentForm == FormType.login)
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Password"),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
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
                                    if (value == null ||
                                        !value.isValidPassword()) {
                                      return 'Please enter strong password';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => _password =
                                      value!, // Update _password on save
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
                                                currentForm =
                                                    FormType.forgotpassword;
                                              });
                                            }),
                                    ),
                                  ),
                              ]),
                          SizedBox(height: 20.0),
                        ]),
                  SizedBox(height: 20.0),
                  if (currentForm == FormType.register)
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          BlocProvider.of<CustomerAuthBloc>(context).add(
                            CustomerRegisterEvent(
                                name: _username,
                                email: _email,
                                password: _password),
                          );
                        } else {
                          BlocProvider.of<CustomerAuthBloc>(context).add(
                            CustomerLoginEvent(
                                email: _email, password: _password),
                          );
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
      }),
    );
  }
}
//...........//
