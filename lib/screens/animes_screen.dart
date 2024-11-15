import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimesScreen extends StatefulWidget {
  const AnimesScreen({super.key});

  @override
  State<AnimesScreen> createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SenpaiDex",
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
        ],
      ),
    );
  }
}
