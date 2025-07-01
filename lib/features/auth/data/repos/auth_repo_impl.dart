import 'package:dartz/dartz.dart';

import 'package:fruits_hub/core/errors/failures.dart';

import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

import '../../domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password) {
    throw UnimplementedError();
  }
}
