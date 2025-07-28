import 'dart:convert';

import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = SharedPreferencesSingleton.getString(kUserData);

  if (jsonString == null || jsonString.isEmpty) {
    throw Exception('No user data found in SharedPreferences');
  }

  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
