import 'package:flutter/material.dart';

// A Controller for the MainScreen

class MainscreenNotifier extends ChangeNotifier {
  int _pageIndex = 0;

  // A getter method to retreive the current page index

  int get pageIndex => _pageIndex;

  // A setter method to set the current page index

  set pageIndex(int newIndex) {
    _pageIndex = newIndex;
    // Notify the listeners about the change
    notifyListeners();
  }
}
