import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ripple/circle_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ripple',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTapDown: (details) {
        children.add(CircleHandler(
          key: Key(Random().nextInt(99999).toString()),
          center: details.globalPosition,
          onComplete: (Key? key) {
            children.removeWhere((element) => element.key == key);
            if (mounted) {
              setState(() {});
            }
          },
        ));
        if (mounted) {
          setState(() {});
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFD2EDFF),
        body: Stack(
          children: children,
        ),
      ),
    ));
  }
}
