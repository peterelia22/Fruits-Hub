import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';

import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

import '../../../../core/services/database_service.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImplementation(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoimpl createUserWithEmailAndPassword: $e.toString()');
      return left(ServerFailure(
          'حدث خطأ غير معروف أثناء إنشاء الحساب. الرجاء المحاولة مرة أخرى.'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoimpl signInWithEmailAndPassword: $e.toString()');
      return left(ServerFailure(
          'حدث خطأ غير معروف أثناء تسجيل الدخول. الرجاء المحاولة مرة أخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checksIfDataExists(
          path: BackendEndpoint.isUserExists, documentId: userEntity.uId);
      if (isUserExists) {
        await getUserData(uId: userEntity.uId);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoimpl signInWithGoogle: $e.toString()');
      return left(ServerFailure(
          'حدث خطأ غير معروف أثناء تسجيل الدخول باستخدام جوجل. الرجاء المحاولة مرة أخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoimpl signInWithFacebook: $e.toString()');
      return left(ServerFailure(
          'حدث خطأ غير معروف أثناء تسجيل الدخول باستخدام فيسبوك. الرجاء المحاولة مرة أخرى.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        BackendEndpoint.addUserData, user.toMap(), user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoint.getUserData, documentId: uId);
    return UserModel.fromJson(userData);
  }
}
