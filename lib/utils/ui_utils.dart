import 'package:flutter/material.dart';
import '../enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  final double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}