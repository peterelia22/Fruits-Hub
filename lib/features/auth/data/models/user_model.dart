import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        name: user.displayName ?? 'No Name',
        email: user.email ?? 'No Email',
        uId: user.uid ?? 'No Uid');
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? 'No Name',
      email: json['email'] ?? 'No Email',
      uId: json['uId'] ?? 'No Uid',
    );
  }
}
