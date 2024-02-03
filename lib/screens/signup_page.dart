
import 'package:flutter/material.dart';
import 'package:listapp/apiServices/login_signup_services.dart';
import 'package:listapp/routes/routeNames.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
              const Text('Sign Up',style: TextStyle(
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
                onPressed: () async{
                  await SharedPreferencesManager.register(context, userNameController.text.trim(), passwordController.text.trim());
                  Navigator.pushNamed(context, RouteName.loginPage);
                },
                child: const Text('Sign Up'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an Account?",style: TextStyle(fontSize: 16,color: Colors.grey),),
                  TextButton(child: Text('Login',style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
                    onPressed: (){
                      Navigator.pushNamed(context, RouteName.loginPage);
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
