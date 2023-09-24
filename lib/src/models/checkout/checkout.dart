import 'dart:convert';
import 'package:paymaya_sdk/paymaya.dart';

class CheckoutAttributes {
  final CheckoutAmount totalAmount;
  final String requestReferenceNumber;

  CheckoutAttributes({
    required this.totalAmount,
    required this.requestReferenceNumber,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'totalAmount': totalAmount.toJson(),
      'requestReferenceNumber': requestReferenceNumber,
    };
  }
  }
class CheckoutResponse {
  const CheckoutResponse({
    required this.checkoutId,
    required this.redirectUrl,
  });
  factory CheckoutResponse.fromMap(Map<String, dynamic> map) {
    return CheckoutResponse(
      checkoutId: map['checkoutId'] ?? '',
      redirectUrl: map['redirectUrl'] ?? '',
    );
  }
  factory CheckoutResponse.fromJson(String source) =>
      CheckoutResponse.fromMap(json.decode(source));

  final String checkoutId;
  final String redirectUrl;

  CheckoutResponse copyWith({
    String? checkoutId,
    String? redirectUrl,
  }) {
    return CheckoutResponse(
      checkoutId: checkoutId ?? this.checkoutId,
      redirectUrl: redirectUrl ?? this.redirectUrl,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'checkoutId': checkoutId,
      'redirectUrl': redirectUrl,
    };
  }
  
  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'PaymayaResponse(checkoutId: $checkoutId, redirectUrl: $redirectUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CheckoutResponse &&
        other.checkoutId == checkoutId &&
        other.redirectUrl == redirectUrl;
  }

  @override
  int get hashCode => checkoutId.hashCode ^ redirectUrl.hashCode;
}