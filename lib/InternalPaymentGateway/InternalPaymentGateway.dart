import 'dart:convert';

import 'package:f_logs/model/flog/flog.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:yroz_admin/result/Failure.dart';
import 'package:yroz_admin/result/OK.dart';
import 'package:yroz_admin/result/ResultInterface.dart';

class InternalPaymentGateway {
  static final InternalPaymentGateway _internalPaymentGateway =
      InternalPaymentGateway._internal();
  static const externalPaymentUrl =
      '0cjie5t2fa.execute-api.us-east-1.amazonaws.com';

  factory InternalPaymentGateway() {
    return _internalPaymentGateway;
  }

  InternalPaymentGateway._internal();

  Future<ResultInterface> _postRequest(
      Uri url, Map<String, String> body) async {
    try {
      var response = await http.post(url, body: json.encode(body));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return new Ok(responseBody["msg"], responseBody);
      }
      return new Failure(responseBody["msg"]);
    } on Exception catch (e) {
      FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      return new Failure(e.toString());
    }
  }

  Future<ResultInterface> _patchRequest(
      Uri url, Map<String, String> body) async {
    try {
      var response = await http.patch(url, body: json.encode(body));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return new Ok(responseBody["msg"], responseBody);
      }
      return new Failure(responseBody["msg"]);
    } on Exception catch (e) {
      FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      return new Failure(e.toString());
    }
  }

  Future<ResultInterface> _deleteRequest(
      Uri url, Map<String, String> body) async {
    try {
      var response = await http.delete(url, body: json.encode(body));
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return new Ok(responseBody["msg"]);
      }
      return new Failure(responseBody["msg"]);
    } on Exception catch (e) {
      FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      return new Failure(e.toString());
    }
  }

  Future<ResultInterface> _getRequest(
      String authority, String unencodedPath, Map<String, String> body) async {
    try {
      var url = Uri.https(authority, unencodedPath, body);
      var response = await http.get(url);
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return new Ok(responseBody["msg"], responseBody);
      }
      return new Failure(responseBody["msg"]);
    } on Exception catch (e) {
      FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      return new Failure(e.toString());
    }
  }

  // params: userId - email, eWalletToken - saved e wallet token that received when calling createUserAccount
  // returns: user's e wallet balance
  Future<ResultInterface<String>> eWalletBalance(
      String userId, String eWalletToken) async {
    var body = {
      "userId": userId,
      "eWalletToken": eWalletToken,
    };
    var result = await _getRequest(externalPaymentUrl, '/dev/eWallet', body);
    if (result.getTag()) {
      String balance = result.getValue()["balance"];
      return new Ok(result.getMessage(), balance);
    }
    return new Failure(result.getMessage());
  }

  Future<ResultInterface<List<Map<String, Object>>>> getPurchaseHistory(
      DateTime startDate, DateTime endDate,
      {String userId = "*", String storeId = "*", bool? succeeded}) async {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
    var body = {
      "startDate": formatter.format(startDate),
      "endDate": formatter.format(endDate),
      "userId": userId,
      "storeId": storeId,
      "succeeded": succeeded == null ? "*" : succeeded.toString()
    };
    var result = await _getRequest(externalPaymentUrl, '/dev/payments', body);
    if (result.getTag()) {
      var purchaseHistory = result.getValue()["purchases"] as List<dynamic>;
      var convertedPurchaseHistory = purchaseHistory
          .map((e) => (e as Map<String, dynamic>)
              .map((key, value) => MapEntry(key, value as Object)))
          .toList();
      return new Ok(result.getMessage(), convertedPurchaseHistory);
    }
    return new Failure(result.getMessage());
  }

  Future<ResultInterface<double>> getYrozBalance(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
    var body = {
      "startDate": formatter.format(startDate),
      "endDate": formatter.format(endDate),
    };
    var result = await _getRequest(externalPaymentUrl, '/dev/yrozAdmin', body);
    if (result.getTag()) {
      FLog.info(text: "profit: ${result.getValue()}");
      double balance = double.parse(result.getValue()["balance"]);
      FLog.info(text: "balance: ${balance}");
      return new Ok(result.getMessage(), balance);
    }
    return new Failure(result.getMessage());
  }
}
