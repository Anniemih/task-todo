// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/theme.dart';
import 'package:todo/services/theme_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
     theme: Themes.light,
     darkTheme: Themes.dark,
     themeMode: ThemeServices().theme,
      home: homePage(),
    );
  }
}