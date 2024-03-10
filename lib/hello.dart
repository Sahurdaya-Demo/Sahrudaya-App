import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hello extends StatefulWidget {
  const Hello({super.key});
  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  String _storedValue = '';
  @override
  void initState() {
    super.initState();
    _loadValueFromSharedPreferences();
  }

  Future<void> _loadValueFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedValue = prefs.getString('email') ?? 'Default Value';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [Text(_storedValue)],
        ),
      )),
    );
  }
}
