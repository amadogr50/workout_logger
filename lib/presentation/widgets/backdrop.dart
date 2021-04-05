import 'dart:ui';

import 'package:flutter/material.dart';

class Backdrop extends StatefulWidget {
  final Widget backLayer;
  final Widget frontLayer;

  const Backdrop({
    Key? key,
    required this.backLayer,
    required this.frontLayer,
  }) : super(key: key);

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  double get screenHeight => MediaQuery.of(context).size.height;

  final GlobalKey _backLayerKey = GlobalKey();

  late AnimationController _controller;
  Animation<double>? _topAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final screenHeight = MediaQuery.of(context).size.height;
      final RenderBox box =
          _backLayerKey.currentContext!.findRenderObject()! as RenderBox;
      final backLayerHeight = box.size.height;
      _topAnimation =
          Tween<double>(begin: 0, end: screenHeight - backLayerHeight + 16)
              .animate(_controller);
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topRight,
        color: Colors.grey,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                key: _backLayerKey,
                color: Colors.amber,
                padding: const EdgeInsets.only(bottom: 16),
                child: widget.backLayer,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  height: _topAnimation?.value,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: widget.frontLayer,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
