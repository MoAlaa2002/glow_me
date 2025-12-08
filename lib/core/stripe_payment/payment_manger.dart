import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:glow_me/core/stripe_payment/stripe_key.dart';

abstract class PaymentManger {
  static Future<void> makePayment(double amount, String currency) async {
    try {
      String clientSecret = await _getClientSecret(
        (amount * 100).toInt().toString(),
        currency,
      );
      await _intializedPaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Intialized Payment Sheet
  static Future<void> _intializedPaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Glow_Me',
      ),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    try {
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StripeKey.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: {
          'amount': int.parse(amount).toString(),
          'currency': currency.toLowerCase(),
          'payment_method_types[]': 'card',
        },
      );

      print("STRIPE RESPONSE: ${response.data}");

      return response.data['client_secret'];
    } catch (e) {
      if (e is DioException) {
        print("STRIPE ERROR RESPONSE DATA: ${e.response?.data}");
      }
      rethrow;
    }
  }
}
