import 'package:flutter/material.dart';

import '../utils/ui_utils.dart';
import 'sizing_information.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  const ResponsiveBuilder({
    required Key key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      final mediaQuery = MediaQuery.of(context);
      final sizingInformation = SizingInformation(
        deviceScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
