import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد تم استخدام هذا البريد الإلكتروني بالفعل.');
      } else {
        throw CustomException(
            message: 'لم يتم إنشاء الحساب بنجاح. الرجاء المحاولة مرة أخرى.');
      }
    } catch (e) {
      throw CustomException(
          message:
              'حدث خطأ غير معروف أثناء إنشاء الحساب. الرجاء المحاولة مرة أخرى.');
    }
  }
}
