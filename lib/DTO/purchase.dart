import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Purchase {
  final String userID;
  final String storeID;
  final String transactionId;
  final double creditAmount;
  final double cashBackAmount;
  final DateTime purchaseDate;
  String? storeName;

  Purchase(this.userID, this.storeID, this.transactionId, this.creditAmount, this.cashBackAmount, this.purchaseDate, {this.storeName});

  Purchase.fromJson(Map<String, dynamic> json)
      : transactionId = json['purchaseToken'],
        userID = json['userId'],
        storeID = json['storeId'],
        cashBackAmount = double.parse(json['cashBackAmount']),
        creditAmount = double.parse(json['creditAmount']),
        purchaseDate =
        DateFormat('dd/MM/yyyy HH:mm:ss').parse(json['purchaseDate']),
        storeName = null;
}