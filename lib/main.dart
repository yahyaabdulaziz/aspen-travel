import 'package:aspen_travel/domain/di/di.dart';
import 'package:aspen_travel/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
