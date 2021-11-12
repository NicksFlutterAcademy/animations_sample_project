import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  final Tween<double> opacityTween = Tween<double>(begin: 0.0, end: 1.0);

  late final Animation<double> _animation;

  @override
  void initState() {

    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 400))
          ..addListener(() {
            setState(() {});
          });

    _animation = opacityTween.animate(CurvedAnimation(parent: _animationController, curve: Curves.ease));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.amber.withOpacity(_animation.value),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {

                if (_animationController.isCompleted) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }

              },
              child: const Text("Animate"),
            ),
          ],
        ),
      ),
    );
  }
}

