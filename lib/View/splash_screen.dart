import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:covidapp/View/World_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin
{
  late final AnimationController controller =
  AnimationController(duration: const Duration(seconds: 3), vsync: this)
    ..repeat();
  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }
  void initState(){
    super.initState();
    setState(() {

    });
    Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>World_screen())) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 70),
                AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext, Widget? child) {
                      return Transform.rotate(
                        angle: controller.value * 2.0 * math.pi,
                        child: const Center(
                          child: Image(
                            image: AssetImage('images/virus.png'),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Covid 19\nTracker App',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )),
              ],
            )));
  }
}
