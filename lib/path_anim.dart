import 'package:flutter/cupertino.dart';

import 'custom_paint.dart';

class PathAnim extends StatefulWidget {
  const PathAnim({Key? key}) : super(key: key);

  @override
  State<PathAnim> createState() => _PathAnimState();
}

class _PathAnimState extends State<PathAnim>
    with TickerProviderStateMixin {
  late Animation<double> curve1, curve2;
  late AnimationController _controller1, _controller2;

  @override
  void initState() {
    _controller1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    curve1 = Tween(begin: 0.5, end: 1.0)
        .animate(CurvedAnimation(parent: _controller1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {
          if (curve1.isCompleted) {
            _controller2.forward();
          }
        });
      });

    curve2 = Tween(begin: 0.5, end: 1.0)
        .animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {
          if (_controller2.isCompleted) {
            _controller2.reverse().whenComplete(() => _controller1
                .reverse()
                .whenComplete(() => _controller1.forward()));
          }
        });
      });

    _controller1.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: CustomCurve(
            context: context,
            curve1_height: curve1.value,
            curve2_height: curve2.value),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/bg.jpg'))),
        ));
  }
}
