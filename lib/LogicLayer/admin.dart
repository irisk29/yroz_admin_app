import 'package:yroz_admin/DataLayer/admin_metrics.dart';

class Admin
{
  final String name = "Yroz";


  Admin()
  {
    AdminMetrics().createRegisteredUsersSubscription();
    AdminMetrics().createPhysicalStoresAmountSubscription();
    AdminMetrics().createOnlineStoresAmountSubscription();
  }
}