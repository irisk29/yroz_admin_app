import 'package:flutter/foundation.dart';

class Purchase {
  final String buyerEmail;
  final String storeEmail;
  final double amount;

  Purchase(this.buyerEmail, this.storeEmail, this.amount);
}