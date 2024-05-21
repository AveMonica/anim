import 'package:flutter/material.dart';

class Impli extends StatefulWidget {
  const Impli({super.key});

  @override
  State<Impli> createState() => _ImpliState();
}

class _ImpliState extends State<Impli> with SingleTickerProviderStateMixin {

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
              show = !show;
                
              });
            },
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            AnimatedOpacity(
              opacity: show ? 1 : 0, 
              duration: Duration(milliseconds: 800),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}