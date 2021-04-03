import 'package:flutter/material.dart';
import 'package:workout_logger/responsive/screen_type_layout.dart';

class _BaseResponsiveText extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double? mobileFontSize;
  final double? mobileHeight;
  final double? tabletFontSize;
  final double? tabletHeight;
  final double? desktopFontSize;
  final double? desktopHeight;
  final Color color;

  const _BaseResponsiveText(
    this.data, {
    Key? key,
    required this.fontWeight,
    required this.mobileFontSize,
    required this.mobileHeight,
    required this.tabletFontSize,
    required this.tabletHeight,
    required this.desktopFontSize,
    required this.desktopHeight,
    Color? color,
  })  : color = color ?? Colors.black,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Text(
        data,
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: mobileFontSize,
          fontWeight: fontWeight,
          color: color,
          height: mobileHeight,
        ),
      ),
      tablet: Text(
        data,
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: tabletFontSize,
          fontWeight: fontWeight,
          color: color,
          height: tabletHeight,
        ),
      ),
      desktop: Text(
        data,
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: desktopFontSize,
          fontWeight: fontWeight,
          color: color,
          height: desktopHeight,
        ),
      ),
      key: GlobalKey(),
    );
  }
}

class _BaseStaticText extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final double fontSize;
  final double height;
  final Color color;

  const _BaseStaticText(
    this.data, {
    Key? key,
    required this.fontWeight,
    required this.fontSize,
    required this.height,
    Color? color,
  })  : color = color ?? Colors.black,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      ),
    );
  }
}

class DisplayLarge extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get desktopFontSize => 69;

  double get desktopHeight => 76;

  double get tabletFontSize => 51;

  double get tabletHeight => 56;

  double get mobileFontSize => 41;

  double get mobileHeight => 48;

  const DisplayLarge.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.bold,
        super(key: key);

  const DisplayLarge.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const DisplayLarge.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseResponsiveText(
      data,
      fontWeight: fontWeight,
      color: color,
      mobileFontSize: mobileFontSize,
      mobileHeight: mobileHeight,
      tabletFontSize: tabletFontSize,
      tabletHeight: tabletHeight,
      desktopFontSize: desktopFontSize,
      desktopHeight: desktopHeight,
    );
  }
}

class DisplaySmall extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get desktopFontSize => 57;

  double get desktopHeight => 64;

  double get tabletFontSize => 44;

  double get tabletHeight => 48;

  double get mobileFontSize => 36;

  double get mobileHeight => 40;

  const DisplaySmall.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.bold,
        super(key: key);

  const DisplaySmall.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const DisplaySmall.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseResponsiveText(
      data,
      fontWeight: fontWeight,
      color: color,
      mobileFontSize: mobileFontSize,
      mobileHeight: mobileHeight,
      tabletFontSize: tabletFontSize,
      tabletHeight: tabletHeight,
      desktopFontSize: desktopFontSize,
      desktopHeight: desktopHeight,
    );
  }
}

class F1 extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get desktopFontSize => 48;

  double get desktopHeight => 52;

  double get tabletFontSize => 38;

  double get tabletHeight => 44;

  double get mobileFontSize => 32;

  double get mobileHeight => 36;

  const F1.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const F1.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const F1.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseResponsiveText(
      data,
      fontWeight: fontWeight,
      color: color,
      mobileFontSize: mobileFontSize,
      mobileHeight: mobileHeight,
      tabletFontSize: tabletFontSize,
      tabletHeight: tabletHeight,
      desktopFontSize: desktopFontSize,
      desktopHeight: desktopHeight,
    );
  }
}

class F2 extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get desktopFontSize => 40;

  double get desktopHeight => 44;

  double get tabletFontSize => 33;

  double get tabletHeight => 36;

  double get mobileFontSize => 29;

  double get mobileHeight => 32;

  const F2.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const F2.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const F2.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseResponsiveText(
      data,
      fontWeight: fontWeight,
      color: color,
      mobileFontSize: mobileFontSize,
      mobileHeight: mobileHeight,
      tabletFontSize: tabletFontSize,
      tabletHeight: tabletHeight,
      desktopFontSize: desktopFontSize,
      desktopHeight: desktopHeight,
    );
  }
}

class F3 extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get desktopFontSize => 33;

  double get desktopHeight => 36;

  double get tabletFontSize => 28;

  double get tabletHeight => 32;

  double get mobileFontSize => 26;

  double get mobileHeight => 32;

  const F3.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const F3.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const F3.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseResponsiveText(
      data,
      fontWeight: fontWeight,
      color: color,
      mobileFontSize: mobileFontSize,
      mobileHeight: mobileHeight,
      tabletFontSize: tabletFontSize,
      tabletHeight: tabletHeight,
      desktopFontSize: desktopFontSize,
      desktopHeight: desktopHeight,
    );
  }
}

class F4 extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get desktopFontSize => 28;

  double get desktopHeight => 32;

  double get tabletFontSize => 24;

  double get tabletHeight => 28;

  double get mobileFontSize => 23;

  double get mobileHeight => 24;

  const F4.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const F4.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const F4.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseResponsiveText(
      data,
      fontWeight: fontWeight,
      color: color,
      mobileFontSize: mobileFontSize,
      mobileHeight: mobileHeight,
      tabletFontSize: tabletFontSize,
      tabletHeight: tabletHeight,
      desktopFontSize: desktopFontSize,
      desktopHeight: desktopHeight,
    );
  }
}

class F5 extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get desktopFontSize => 23;

  double get desktopHeight => 24;

  double get tabletFontSize => 21;

  double get tabletHeight => 24;

  double get mobileFontSize => 20;

  double get mobileHeight => 24;

  const F5.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const F5.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const F5.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseResponsiveText(
      data,
      fontWeight: fontWeight,
      color: color,
      mobileFontSize: mobileFontSize,
      mobileHeight: mobileHeight,
      tabletFontSize: tabletFontSize,
      tabletHeight: tabletHeight,
      desktopFontSize: desktopFontSize,
      desktopHeight: desktopHeight,
    );
  }
}

class F6 extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get desktopFontSize => 19;

  double get desktopHeight => 20;

  double get tabletFontSize => 18;

  double get tabletHeight => 20;

  double get mobileFontSize => 18;

  double get mobileHeight => 20;

  const F6.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const F6.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const F6.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseResponsiveText(
      data,
      fontWeight: fontWeight,
      color: color,
      mobileFontSize: mobileFontSize,
      mobileHeight: mobileHeight,
      tabletFontSize: tabletFontSize,
      tabletHeight: tabletHeight,
      desktopFontSize: desktopFontSize,
      desktopHeight: desktopHeight,
    );
  }
}

class ParagraphLarge extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get desktopFontSize => 23;

  double get desktopHeight => 36;

  double get tabletFontSize => 21;

  double get tabletHeight => 32;

  double get mobileFontSize => 20;

  double get mobileHeight => 28;

  const ParagraphLarge.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const ParagraphLarge.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const ParagraphLarge.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseResponsiveText(
      data,
      fontWeight: fontWeight,
      color: color,
      mobileFontSize: mobileFontSize,
      mobileHeight: mobileHeight,
      tabletFontSize: tabletFontSize,
      tabletHeight: tabletHeight,
      desktopFontSize: desktopFontSize,
      desktopHeight: desktopHeight,
    );
  }
}

class ParagraphBase extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get fontSize => 16;

  double get height => 24;

  const ParagraphBase.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const ParagraphBase.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const ParagraphBase.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseStaticText(
      data,
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      height: height,
    );
  }
}

class ParagraphSmall extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get fontSize => 13;

  double get height => 20;

  const ParagraphSmall.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const ParagraphSmall.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const ParagraphSmall.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseStaticText(
      data,
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      height: height,
    );
  }
}

class ParagraphXSmall extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get fontSize => 11;

  double get height => 16;

  const ParagraphXSmall.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const ParagraphXSmall.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const ParagraphXSmall.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseStaticText(
      data,
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      height: height,
    );
  }
}

class ParagraphTiny extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get fontSize => 9;

  double get height => 12;

  const ParagraphTiny.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const ParagraphTiny.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const ParagraphTiny.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseStaticText(
      data,
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      height: height,
    );
  }
}

class SmallCaps extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color? color;

  double get fontSize => 14;

  double get height => 20;

  const SmallCaps.heavy(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w600,
        super(key: key);

  const SmallCaps.regular(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.normal,
        super(key: key);

  const SmallCaps.light(
    this.data, {
    Key? key,
    this.color,
  })  : fontWeight = FontWeight.w300,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseStaticText(
      data,
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      height: height,
    );
  }
}
