
import 'package:flutter/material.dart';

import '../routes/routeNames.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
            (value) => Navigator.popAndPushNamed(context, RouteName.loginPage));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('List App',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),),
            SizedBox(height: 30,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
