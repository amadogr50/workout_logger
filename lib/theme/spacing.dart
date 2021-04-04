import 'package:flutter/material.dart';
import 'package:workout_logger/theme/dimensions.dart';

class HorizontalSpacing extends StatelessWidget {
  final double size;

  const HorizontalSpacing.xxs({Key? key})
      : size = Dimensions.xxs,
        super(key: key);

  const HorizontalSpacing.xs({Key? key})
      : size = Dimensions.xs,
        super(key: key);

  const HorizontalSpacing.s({Key? key})
      : size = Dimensions.s,
        super(key: key);

  const HorizontalSpacing.m({Key? key})
      : size = Dimensions.m,
        super(key: key);

  const HorizontalSpacing.l({Key? key})
      : size = Dimensions.l,
        super(key: key);

  const HorizontalSpacing.xl({Key? key})
      : size = Dimensions.xl,
        super(key: key);

  const HorizontalSpacing.xxl({Key? key})
      : size = Dimensions.xxl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}

class VerticalSpacing extends StatelessWidget {
  final double size;

  const VerticalSpacing.xxs({Key? key})
      : size = Dimensions.xxs,
        super(key: key);

  const VerticalSpacing.xs({Key? key})
      : size = Dimensions.xs,
        super(key: key);

  const VerticalSpacing.s({Key? key})
      : size = Dimensions.s,
        super(key: key);

  const VerticalSpacing.m({Key? key})
      : size = Dimensions.m,
        super(key: key);

  const VerticalSpacing.l({Key? key})
      : size = Dimensions.l,
        super(key: key);

  const VerticalSpacing.xl({Key? key})
      : size = Dimensions.xl,
        super(key: key);

  const VerticalSpacing.xxl({Key? key})
      : size = Dimensions.xxl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}