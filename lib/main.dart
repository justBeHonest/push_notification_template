import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      title: 'Material App',
      home: const FirstPage(),
    );
  }
}
