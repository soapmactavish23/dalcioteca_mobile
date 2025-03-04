import 'dart:developer';

import 'package:flutter/material.dart';

class PageManager {
  final PageController _pageController;

  PageManager(this._pageController);

  int page = 0;

  // Client Views
  static int home = 0;

  void setPage(int value) {
    try {
      if (value == page) return;
      page = value;
      _pageController.jumpToPage(value);
    } catch (e, s) {
      log('Error: $e', error: e, stackTrace: s);
    }
  }
}
