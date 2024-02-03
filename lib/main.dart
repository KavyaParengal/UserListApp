
import 'package:flutter/material.dart';
import 'package:listapp/provider/user_data_provider.dart';
import 'package:listapp/routes/routeNames.dart';
import 'package:listapp/routes/routeNavigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: RouteNavigation.generateRoute,
      ),
    )
  );
}