import 'package:f_logs/model/flog/flog.dart';
import 'package:yroz_admin/DataLayer/admin_metrics.dart';
import 'package:yroz_admin/InternalPaymentGateway/InternalPaymentGateway.dart';

class Admin
{
  static final Admin _singleton = Admin._internal();

  factory Admin() {
    return _singleton;
  }

  Admin._internal() {
    AdminMetrics().createRegisteredUsersSubscription();
    AdminMetrics().createPhysicalStoresAmountSubscription();
    AdminMetrics().createOnlineStoresAmountSubscription();
  }

  final String name = "Yroz";

  int getRegisteredUsersAmount(){
    return AdminMetrics().numOfRegisteredUsers;
  }

  int getsAmountOfPhysicalStores(){
    return AdminMetrics().numOfPhysicalStores;
  }

  int getsAmountOfOnlineStores(){
    return AdminMetrics().numOfOnlineStores;
  }

  Future<double> getCompanyProfit(DateTime start, DateTime end) async
  {
    try {
      var res = await InternalPaymentGateway().getYrozBalance(start, end);
      FLog.info(text: res.getValue()!.toString());
      if(!res.getTag())
      {
        FLog.error(text: res.getMessage());
        return -1;
      }
      FLog.info(text: res.getValue()!.toString());
      return res.getValue()!;
    } on Exception catch (e) {
      FLog.error(text: e.toString());
      return -1;
    }
  }
}