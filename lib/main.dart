import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_route_builder/second_screen.dart';

void main(List<String> args) {
  runApp(const ScaleTransitionExample());
}

class ScaleTransitionExample extends StatefulWidget {
  const ScaleTransitionExample({super.key});

  @override
  State<ScaleTransitionExample> createState() => _ScaleTransitionExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _ScaleTransitionExampleState extends State<ScaleTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text("First Screen"),
            ),
            body: Center(
                child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: TextButton(
                child: const Text(
                  "Go",
                  style: TextStyle(color: Colors.black),
                ),
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
                              return ScaleTransition(
                                scale: animation.drive(tween),
                                child: const SecondScreen(),
                              );
                            });
                      },
                      pageBuilder: (_, animation, secondaryAnimation) {
                        return const SecondScreen();
                      },
                    ),
                  );
                },
              ),
            )));
      }),
    );
  }
}
