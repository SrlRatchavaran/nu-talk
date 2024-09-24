import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nutalk/helper/navigator_helper_app.dart';
import 'package:provider/provider.dart';

void main() async {
  CustomNavigatorHelperApp.instance;
  await EasyLocalization.ensureInitialized();
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('th'),
        ],
        path: 'assets/language',
        child: const MyApp(),
      ),
    );
  }, (error, stackTrace) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, __, ___) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'NUtalk',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          routerConfig: CustomNavigatorHelperApp.router,
          builder: (context, child) => child ?? Container(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      }
    );
  }
}
