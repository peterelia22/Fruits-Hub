import '../../features/auth/domain/entites/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData(
      String path, Map<String, dynamic> data, String? documentId);
  Future<dynamic> getData(
      {required String path, String? documentId, Map<String, dynamic>? query});
  Future<bool> checksIfDataExists(
      {required String path, required String documentId});
}
