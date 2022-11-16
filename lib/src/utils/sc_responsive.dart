import 'dart:math' as math;

import 'package:flutter/material.dart';

class SCResponsive {
  double _width = 0;
  double _height = 0;
  double _diagonal = 0;

  SCResponsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;

    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
  }

  static SCResponsive of(BuildContext context) => SCResponsive(context);

  double widthPercentage(double percentage) {
    return _width * percentage / 100;
  }

  double heightPercentage(double percentage) {
    return _height * percentage / 100;
  }

  double diagonalPercentage(double percentage) {
    return _diagonal * percentage / 100;
  }

  double get diagonal => _diagonal;

  double get height => _height;

  double get width => _width;
}
