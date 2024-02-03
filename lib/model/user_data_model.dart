class UserDataModel{
  int? userId;
  int? id;
  String? title;
  String? body;

  UserDataModel(
    { required this.userId,
      required this.id,
      required this.title,
      required this.body
    }
  );

  factory UserDataModel.fromJson(Map<String, dynamic> json){
    return UserDataModel(
        userId: json['userId']==null?0:json['userId'],
        id: json['id']==null?0:json['id'],
        title: json['title']==null?'':json['title'],
        body: json['body']==null?'':json['body'],
    );
  }
}

// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part "user_data_model.freezed.dart";
// part 'user_data_model.g.dart';
//
// @freezed
// class UserDataModel with _$UserDataModel {
//   factory UserDataModel({
//     @JsonKey(name: 'userId') int? userId,
//     @JsonKey(name: 'id') int? id,
//     @JsonKey(name: 'title') String? title,
//     @JsonKey(name: 'body') String? body,
//   }) = _UserDataModel;
//
//   factory UserDataModel.fromJson(Map<String, dynamic> json) =>
//       _$UserDataModelFromJson(json);
// }
