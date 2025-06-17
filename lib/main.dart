import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mobile_document/components/bottomNavigatorWidget.dart';
import 'package:mobile_document/components/hiveDatabase.dart';
import 'package:mobile_document/components/messageHepler.dart';
import 'package:mobile_document/provider/auth_provider.dart';
import 'package:mobile_document/provider/home_provider.dart';
import 'package:mobile_document/router/router.dart' show RouterAPI;
import 'package:mobile_document/view/auth/Login.dart';
import 'package:mobile_document/view/home/home.dart';
import 'package:nav_service/nav_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveDatabase().hiveDatabase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(
          create:
              (_) =>
                  HomeProvider()
                    ..getDocumnetIn()
                    ..getDocumnetOut(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterAPI.generateRoutes,
      navigatorKey: NavService.navigatorKey,
      scaffoldMessengerKey: MessageHelper.scaffoldMessengerKey,
      home: LoginView(),
    );
  }
}
