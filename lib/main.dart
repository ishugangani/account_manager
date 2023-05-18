import 'package:account_manager/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:account_manager/screen/detail/view/detail_screen.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/',page: () => HomeScreen()),
        GetPage(name: '/detail',page: () => DetailScreen()),
      ],
    ),
  );
}