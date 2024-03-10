import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sahrudaya_app/hello.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'button.dart';
import 'textfield.dart';
import 'square_tile.dart';
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
        var res = await http.post(Uri.parse("http://192.168.1.6:8000/login/"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(data));
        // final Map<String, dynamic> response = json.decode(res.body);
        // var msg = response['msg'];
        if (res.statusCode == 200) {
          await prefs.setString('email', usernameController.text);
          if (!mounted) return;
          // Navigator.of(context).pop();
          showToast('Logged In Successfully');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Hello()),
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
                      color: const Color.fromARGB(255, 19, 165, 14),
                      child: const Center(
                        child: SquareTile(imagePath: 'lib/images/logo.png'),
                      )),
                ),
                const SizedBox(
                  height: 100,
                ),
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

                      const SizedBox(height: 25),

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
