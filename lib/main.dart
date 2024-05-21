import 'package:flutter/material.dart';
import 'package:flutter_application_1/expli.dart';
import 'package:flutter_application_1/impli.dart';

void main() {
  runApp(Anim());
}

class Anim extends StatelessWidget {
  const Anim({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Impli(),
    );
  }
}