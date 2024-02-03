
import 'package:flutter/material.dart';
import 'package:listapp/apiServices/login_signup_services.dart';

import '../routes/routeNames.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 20,),
              const Text('Login',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),),
              TextField(
                controller: userNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: Size(MediaQuery.of(context).size.width, 55)
                ),
                onPressed: () {
                  SharedPreferencesManager.login(context, userNameController.text.trim(), passwordController.text.trim());
                  Navigator.pushNamed(context, RouteName.homePage);
                },
                child: const Text('Login'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an Account?",style: TextStyle(fontSize: 16,color: Colors.grey),),
                  TextButton(child: Text('Sign UP',style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
                    onPressed: (){
                      Navigator.pushNamed(context, RouteName.signUp);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
