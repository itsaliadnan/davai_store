import 'package:flutter/material.dart';
import '../responsive/breakpoints.dart';

extension Responsive on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  bool get isMobile => width < AppBreakpoints.mobile;

  bool get isTablet =>
      width >= AppBreakpoints.mobile && width < AppBreakpoints.tablet;

  bool get isDesktop => width >= AppBreakpoints.tablet;
}
