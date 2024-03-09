import 'dart:convert';

import 'package:flutter/material.dart';
import 'button.dart';
import 'textfield.dart';
import 'square_tile.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void sendData() async {
    var data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };
    var res = await http.post(Uri.parse("http://192.168.1.6:8000/fdemo/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        minimum: EdgeInsets.only(bottom: 25),
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              const SquareTile(imagePath: 'lib/images/logo.png'),

              const SizedBox(height: 10),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: sendData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
