import 'package:flutter/material.dart';

class FadeinWidget extends StatefulWidget {
  final dynamic child;
  const FadeinWidget({super.key, required this.child});

  @override
  State<FadeinWidget> createState() => _FadeinWidgetState();
}

class _FadeinWidgetState extends State<FadeinWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FadeTransition(opacity: _animation, child: widget.child),
    );
  }
}
