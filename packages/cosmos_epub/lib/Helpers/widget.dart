import 'dart:ui';

import 'package:flutter/material.dart';

extension ExtensionWidget on Widget {
  Widget tooltip(String tip) => Tooltip(
        message: tip,
        child: this,
      );

  Widget get center => Center(child: this);

  Widget cursor({MouseCursor cursor = SystemMouseCursors.click}) => MouseRegion(
        cursor: cursor,
        child: this,
      );

  Widget margin({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Container(
          margin: EdgeInsets.only(
            top: top ?? vertical ?? all ?? 0.0,
            bottom: bottom ?? vertical ?? all ?? 0.0,
            left: left ?? horizontal ?? all ?? 0.0,
            right: right ?? horizontal ?? all ?? 0.0,
          ),
          child: this);

  Widget get backdrop => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: this,
      );

  Widget backdropWithSigma(double sigma) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: this,
      );
}
