import 'package:flutter/material.dart';

import 'main.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Third Screen"),
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.purple,
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
                            return FadeTransition(
                              opacity: animation,
                              child:const ScaleTransitionExample(),);
                          },
                        );
                      },
                      pageBuilder: (_, animation, secondaryAnimation) =>
                      const ScaleTransitionExample()),
                );
              },
              child: const Text("Go",style: TextStyle(color: Colors.black),),
            ),
          )
        ),
      );
    });
  }
}
