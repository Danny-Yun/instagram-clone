import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/router/RoutePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          // 앱바 커스텀 - 흰 배경, 글씨 검정
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RoutePage.NAVIGATION_ROUTE,
      getPages: RoutePage.getPageList,
    );
  }
}
