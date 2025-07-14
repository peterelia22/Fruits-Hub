import '../../features/auth/domain/entites/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData(
      String path, Map<String, dynamic> data, String? documentId);
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});
  Future<bool> checksIfDataExists(
      {required String path, required String documentId});
}
