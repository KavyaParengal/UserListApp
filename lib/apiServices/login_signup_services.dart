import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listapp/routes/routeNames.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {

  static Future<void> register(BuildContext context, String userName, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userName, userName);
    prefs.setString(password, password);
    print('Registered Username: ${userName}');
    print('Registered Password: ${password}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registered successfully!'))
    );
  }

  static Future<void> login(BuildContext context, String userName, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('userName');
    String? storedPassword = prefs.getString('password');
    print('j');
    print(storedUsername);
    if (storedUsername == userName && storedPassword == password) {
      print('j');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!'))
      );
      Navigator.pushNamed(context, RouteName.homePage);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password'))
      );
    }
  }
}