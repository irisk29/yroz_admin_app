import 'dart:convert';

import 'package:f_logs/model/flog/flog.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'package:yroz_admin/result/Failure.dart';
import 'package:yroz_admin/result/OK.dart';
import 'package:yroz_admin/result/ResultInterface.dart';

class FeedBackAnalysis {
  static final FeedBackAnalysis _internalPaymentGateway = FeedBackAnalysis._internal();
  static const externalPaymentUrl = 'kro2b6pe1f.execute-api.us-east-1.amazonaws.com';

  factory FeedBackAnalysis() {
    return _internalPaymentGateway;
  }

  FeedBackAnalysis._internal();

  Future<ResultInterface> _getRequest(String authority, String unencodedPath) async {
    try {
      var url = Uri.https(authority, unencodedPath);
      var response = await http.get(url);
      var responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return new Ok("Email analysis finished", responseBody);
      }
      return new Failure("failed to get email analysis");
    } on Exception catch (e) {
      FLog.error(text: e.toString(), stacktrace: StackTrace.current);
      return new Failure(e.toString());
    }
  }

  // params: userId - email, eWalletToken - saved e wallet token that received when calling createUserAccount
  // returns: user's e wallet balance
  Future<ResultInterface<Tuple2<Map<String, double>, List<String>>>> getEmailAnalysis() async {
    var result = await _getRequest(externalPaymentUrl, '/dev/analyze');
    if (result.getTag()) {
      Map<String, double> avg =
          (jsonDecode(result.getValue()["avg"]) as Map<String, dynamic>).map((key, value) => MapEntry(key, value));
      List<String> info = (jsonDecode(result.getValue()["info"]) as List<dynamic>).map((e) => e as String).toList();
      return new Ok(result.getMessage(), new Tuple2(avg, info));
    }
    return new Failure(result.getMessage());
  }
}
