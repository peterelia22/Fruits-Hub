import 'package:fruits_hub/core/repos/orders_repo/order_repo_impl.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub/core/repos/products_repo/products_repo_implementation.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import 'database_service.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  getIt.registerSingleton<AuthRepo>(AuthRepoImplementation(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>()));
  getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImplementation(getIt<DatabaseService>()));
  getIt.registerSingleton<OrdersRepo>(OrderRepoImpl(getIt<DatabaseService>()));
}
