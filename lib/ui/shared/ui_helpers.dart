import 'package:flutter/material.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _verticalspacesmall = 10.0;
  static const double _verticalspacemedium = 20.0;
  static const double _verticalspacelarge = 60.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _horizontalspacesmall = 10.0;
  static const double _horizontalspacemedium = 20.0;
  static const double _horizontalspacelarge = 60.0;

  /// Returns a vertical space with height set to [_verticalspacesmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(_verticalspacesmall);
  }

  /// Returns a vertical space with height set to [_verticalspacemedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(_verticalspacemedium);
  }

  /// Returns a vertical space with height set to [_verticalspacelarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(_verticalspacelarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_horizontalspacesmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_horizontalspacesmall);
  }

  /// Returns a vertical space with height set to [_horizontalspacemedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_horizontalspacemedium);
  }

  /// Returns a vertical space with height set to [_horizontalspacelarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(_horizontalspacelarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }
}
