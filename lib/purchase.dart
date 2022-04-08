import 'package:flutter/foundation.dart';

class Purchase {
  final String buyerEmail;
  final String storeEmail;
  final double amount;
  final String transactionId;

  Purchase(this.buyerEmail, this.storeEmail, this.amount, this.transactionId);
}