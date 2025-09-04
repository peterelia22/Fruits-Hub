import 'dart:convert';
import 'dart:developer';
import 'package:fruits_hub/features/checkout/domain/entities/paymob_payment_entity.dart';
import 'package:http/http.dart' as http;

class PaymobService {
  static const String _baseUrl = 'https://accept.paymob.com';
  static const String _intentionEndpoint = '/v1/intention/';

  final String _secretKey;
  final String _publicKey;

  PaymobService({
    required String secretKey,
    required String publicKey,
  })  : _secretKey = secretKey,
        _publicKey = publicKey;

  Future<Map<String, dynamic>?> createPaymentIntention(
    PaymobPaymentEntity paymentEntity,
  ) async {
    try {
      log('Creating Paymob payment intention: ${paymentEntity.toJson()}');

      final response = await http.post(
        Uri.parse('$_baseUrl$_intentionEndpoint'),
        headers: {
          'Authorization': 'Token $_secretKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(paymentEntity.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        log('Paymob response: $jsonResponse');
        return jsonResponse;
      } else {
        log('Error creating payment intention: ${response.statusCode}');
        log('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      log('Exception in createPaymentIntention: $e');
      return null;
    }
  }

  String generateCheckoutUrl(String clientSecret) {
    return 'https://accept.paymob.com/unifiedcheckout/?publicKey=$_publicKey&clientSecret=$clientSecret';
  }
}
