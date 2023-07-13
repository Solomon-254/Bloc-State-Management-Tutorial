// import 'package:json_annotation/json_annotation.dart';
// part 'user_model.g.dart';

// @JsonSerializable()
// class UserModel {
//   final int id;
//   final String firstname;
//   final String lastname;
//   final String avatar;

//    UserModel(
//    {
//      required this.id, required this.firstname, required this.lastname,required this.avatar
//    }
//    );

//    factory UserModel.fromJson(Map<String, dynamic> json) =>
//       _$UserModelFromJson(json);

// }

class UserModel {
  final int id;
  final String firstname;
  final String lastname;
  final String avatar;

  UserModel(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 1,
      firstname: json['first_name'] ?? "",
      lastname: json['last_name'] ?? "",
      avatar: json['avatar']  ?? "",
    );
  }
}
