import 'dart:convert';

import 'package:listapp/model/user_data_model.dart';
import 'package:http/http.dart' as http;

class UserDataAPI {
  Future<List<UserDataModel>> getUserData() async{
    const urls = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(Uri.parse(urls));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      print(body);
      List<UserDataModel> data =  body.map<UserDataModel>((e) => UserDataModel.fromJson(e)).toList();
      print(data);
      return data;
    } else {
      List<UserDataModel> data = [];
      return data;
    }
  }
}