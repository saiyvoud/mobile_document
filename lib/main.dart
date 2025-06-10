import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mobile_document/components/hiveDatabase.dart';
import 'package:mobile_document/components/messageHepler.dart';
import 'package:mobile_document/router/router.dart' show RouterAPI;
import 'package:mobile_document/view/auth/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveDatabase().hiveDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterAPI.generateRoutes,
      scaffoldMessengerKey: MessageHelper.scaffoldMessengerKey,
      home: LoginView(),
    );
  }
}
