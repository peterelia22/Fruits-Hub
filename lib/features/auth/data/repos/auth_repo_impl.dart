import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';

import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImplementation({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(
          'حدث خطأ غير معروف أثناء إنشاء الحساب. الرجاء المحاولة مرة أخرى.'));
    }
  }
}
