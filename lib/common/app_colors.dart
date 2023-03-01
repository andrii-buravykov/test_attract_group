import 'package:flutter/material.dart';

class AppColors {
  static final _singleton = AppColors._init();
  static final shared = _singleton;

  AppColors._init();

  Color get black => const Color.fromRGBO(32, 35, 41, 1);

  Color get orange => Colors.orange;
}
