import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:yroz_admin/DTO/store.dart';
import 'package:yroz_admin/DTO/user.dart';
import 'package:yroz_admin/DataLayer/admin_metrics.dart';
import 'package:yroz_admin/InternalPaymentGateway/InternalPaymentGateway.dart';
import 'package:yroz_admin/models/ModelProvider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:yroz_admin/amplifyconfiguration.dart';

void main() {
  bool configured = false;

  Future<void> _configureAmplify() async {
    if (!configured) {
      Amplify.addPlugin(AmplifyAuthCognito());
      Amplify.addPlugin(AmplifyStorageS3());
      Amplify.addPlugin(
          AmplifyDataStore(modelProvider: ModelProvider.instance));
      Amplify.addPlugin(AmplifyAPI());

      // Amplify can only be configured once.
      try {
        await Amplify.configure(amplifyconfig);
        configured = true;
      } on AmplifyAlreadyConfiguredException {
        print("Amplify was already configured. Was the app restarted?");
      }
    }
  }

  IntegrationTestWidgetsFlutterBinding
      .ensureInitialized(); // to make the tests work

  group('open online store', () {
    final binding = IntegrationTestWidgetsFlutterBinding
        .ensureInitialized() as IntegrationTestWidgetsFlutterBinding;
    setUp(() {
      return Future(() async {
        await _configureAmplify();
        UserModel currUser = new UserModel(
            email: "unittest@gmail.com",
            name: "test name",
            hideStoreOwnerOptions: false,
            isLoggedIn: true);
        await Amplify.DataStore.save(currUser);
        OnlineStoreModel onlineStoreModel = OnlineStoreModel(
            name: "online test",
            phoneNumber: "+972123456789",
            address: "Ashdod, Israel",
            operationHours: "Sunday-7:00 AM,11:59 PMMonday-7:00 AM,11:59 PMTuesday-7:00 AM,11:59 PMWednesday-7:00 AM,11:59 PMThursday-7:00 AM,11:59 PMFriday-closedSaturday-closed",
            categories: "[\"Food\"]",
            qrCode: "");
        await Amplify.DataStore.save(onlineStoreModel);
      });
    });

    test('good scenario', () async {
      List<Store> stores = await AdminMetrics().fetchStores();
      expect(stores.length > 0, true);
      expect(stores[0].storeName, "online test");
    });

  });
}
