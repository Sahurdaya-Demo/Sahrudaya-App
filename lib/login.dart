import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sahrudaya_app/cform.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'button.dart';
import 'textfield.dart';

import 'package:http/http.dart' as http;
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void sendData(void Function(String) showToast) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var data = {
        "email": usernameController.text,
        "password": passwordController.text,
      };
      if (usernameController.text.contains('@')) {
        var res = await http.post(Uri.parse("http://192.168.1.8:8000/login/"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(data));
        final Map<String, dynamic> response = json.decode(res.body);
        var msg = response['msg'];
        if (msg == 'Login Success') {
          await prefs.setString('email', usernameController.text);
          if (!mounted) return;
          // Navigator.of(context).pop();
          showToast('Logged In Successfully');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Cform()),
          );
        } else {
          showToast('Email And Password Mismatch');
        }
      } else {
        showToast('Provide a valid email address');
      }
    } catch (value) {
      debugPrint('debug:$value');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        // minimum: const EdgeInsets.only(bottom: 205),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.only(bottom: screenHeight / 20),
                      color: const Color.fromRGBO(15, 150, 83, 1),
                      child: Center(
                        child: Image.asset(
                          'lib/images/logo.png',
                          height: 170,
                          width: 170,
                          fit: BoxFit.contain,
                        ),
                      )),
                ),
                // const SizedBox(
                //   height: sheight*0.5,
                // ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Column(children: [
                      const Text(
                        'Welcome back you\'ve been missed!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 126, 44),
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // username textfield
                      MyTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: usernameController,
                        hintText: 'Username',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      // password textfield
                      MyTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 15),

                      // sign in button
                      MyButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            sendData((message) {
                              toastification.show(
                                context: context,
                                alignment: Alignment.bottomCenter,
                                type: ToastificationType.success,
                                style: ToastificationStyle.flatColored,
                                showProgressBar: false,
                                title: Text(message),
                                autoCloseDuration: const Duration(seconds: 5),
                                borderRadius: BorderRadius.circular(50),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 20),
                              );
                            });
                          }
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: screenHeight / 40),
                        child: GestureDetector(
                          onTap: () {
                            // Show a popup or dialog for entering email
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Adjust the value as needed
                                  ),
                                  title: const Text('Enter Your Email'),
                                  content: const TextField(
                                    decoration:
                                        InputDecoration(hintText: 'Email'),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Handle email submission
                                        // You can add your logic here
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('Submit'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 19, 165, 14),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
