import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';
import 'package:link_shortener_app/core/utils/constants.dart';
import 'package:link_shortener_app/features/home/factories/presentation/home_screen_factory.dart';

void main() async {
  final path = Directory.systemTemp.path;
  Hive.init(path);
  await Hive.openBox(databaseOffName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: homeScreenFactory());
  }
}
