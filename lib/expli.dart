import 'package:flutter/material.dart';

class Expli extends StatefulWidget {
  const Expli({super.key});

  @override
  State<Expli> createState() => _ExpliState();
}

class _ExpliState extends State<Expli> with TickerProviderStateMixin {

  late AnimationController animationController;
  late AnimationController animationController2;

  void op() {
    animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    ); // upon loading ..forward() here or animationController.forward()
    op();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              animationController.forward();
            }, 
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: animationController, 
              builder: (context, child) {
                // return Padding(
                //   padding: EdgeInsets.only(top: 200 * animationController.value),
                //   child: child!,
                // );
                // return SlideTransition(
                //   position: animationController.drive(Tween<Offset>(
                //     begin: Offset(1, 0), // from top (0, -1)
                //     end: Offset(0, 0),
                //   )),
                //   child: child!,
                // );
                // return SlideTransition(
                //   position: Tween(begin: Offset(0, 0), end: Offset(0, 1)).animate(
                //     CurvedAnimation(
                //       parent: animationController,
                //       curve: Curves.elasticIn,
                //     ),
                //   ),
                //   child: child,
                // );
                
                //  return FadeTransition(
                //   opacity: Tween<double>(begin: 0.5, end: 1).animate(
                //     CurvedAnimation(
                //       parent: animationController,
                //       curve: Curves.linear,
                //     ),
                //   ),
                //   child: child,
                // );
                //   return SizeTransition(
                //   sizeFactor: Tween<double>(begin: 0, end: 1).animate(
                //     CurvedAnimation(
                //       parent: animationController,
                //       curve: Curves.linear,
                //     ),
                //   ),
                //   axis: Axis.horizontal,
                //   child: child,
                // );
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.5, end: 1).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Curves.easeIn,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: child,
                );
              },
              // DONT FORGET THIS
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
              ),
            ),
            
            // ----FOR OTHER ANIMATION----
            AnimatedBuilder(
              animation: animationController2, 
              builder: (context, child) {
                return Opacity(
                  opacity: animationController2.value,
                  child: child!,
                );
              },
              child: Container(
                height: 200,
                width: 200,
                  decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                animationController2.forward();
              }, 
              child: Text('OPACITY'),
            ),
          ],
        ),
      ),
    );
  }
}