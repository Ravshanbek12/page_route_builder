import 'package:flutter/material.dart';
import 'package:page_route_builder/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Second Screen"),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 2),
                      reverseTransitionDuration: const Duration(seconds: 2),
                      transitionsBuilder:
                          (_, animation, secondaryAnimation, child) {
                        return AnimatedBuilder(
                          animation: animation,
                          builder: (_, child) {
                            const begin = 0.0;
                            const end = 1.0;
                            var tween = Tween<double>(begin: begin, end: end);
                            return RotationTransition(
                              turns: animation.drive(tween),
                              child: const ThirdScreen(),
                            );
                          },
                        );
                      },
                      pageBuilder: (_, animation, secondaryAnimation) =>
                          const ThirdScreen(),
                    ),
                  );
                },
                child: const Text("Go",style: TextStyle(color: Colors.black),),
              ),
            ),
          ),
        ),
      );
    });
  }
}
