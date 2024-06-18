import 'package:flutter/material.dart';
import 'package:clean_code_ruan/app/di.dart';
import 'package:clean_code_ruan/app/app.dart';

void main() {
  runApp(
    AppDependencies(
      child: MyApp(),
    ),
  );
}
