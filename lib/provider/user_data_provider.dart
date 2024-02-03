import 'package:flutter/cupertino.dart';
import 'package:listapp/model/user_data_model.dart';

import '../apiServices/api_service.dart';

class UserDataProvider extends ChangeNotifier{

  final _service = UserDataAPI();
  bool isLoading = false;
  List<UserDataModel> _userDatas = [];
  List<UserDataModel> get userDatas => _userDatas;

  Future<void> getAllDatas() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getUserData();

    _userDatas = response;
    isLoading = false;
    notifyListeners();
  }
}