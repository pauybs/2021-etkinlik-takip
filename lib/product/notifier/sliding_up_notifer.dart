import 'package:flutter/material.dart';

class SlidingUpNotifier extends ChangeNotifier {
  double? _panelSlide;
  bool? _isShow;

  double get panelSlide => _panelSlide ?? 0;
  bool get isShow => _isShow ?? false;

  void setPanelSlide(double value) {
    _panelSlide = value;
    notifyListeners();
  }

  void setPanelShow(bool value) {
    _isShow = value;
    notifyListeners();
  }

  // void setScrollControllerValue(ScrollController value) {
  //   _currentScrollController = value;
  //   notifyListeners();
  // }
}
