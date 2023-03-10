import 'package:flutter/material.dart';

class JumpingWidget extends StatefulWidget {
  const JumpingWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeIn,
    this.offsetYDistance = 0.2,
  });
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double offsetYDistance;

  @override
  State<JumpingWidget> createState() => _JumpingWidgetState();
}

class _JumpingWidgetState extends State<JumpingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, widget.offsetYDistance),
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}
