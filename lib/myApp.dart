import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/routes/routes_helper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes(),
    );
  }
}
