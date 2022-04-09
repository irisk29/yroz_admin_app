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
}