import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_leaning_app/common/service/storage_service.dart';

import 'main.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    app = await Firebase.initializeApp();

    auth = FirebaseAuth.instanceFor(app: app);

    if (shouldUseFirebaseEmulator) {
      await auth.useAuthEmulator('localhost', 9099);
    }

    storageService = await StorageService().init();
  }
}
