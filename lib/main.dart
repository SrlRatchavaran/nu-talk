import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nutalk/constant.dart';
import 'package:nutalk/helper/navigator_helper_app.dart';

void main() async {
  CustomNavigatorHelperApp.instance;
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('th'),
      ],
      path: 'assets/langauge',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NU talk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: CustomNavigatorHelperApp.router,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), child: child ?? Container()),
    );
  }
}
