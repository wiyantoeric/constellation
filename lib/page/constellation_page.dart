import 'package:constellation/model/constellation.dart';
import 'package:flutter/material.dart';

class ConstellationPage extends StatefulWidget {
  const ConstellationPage({super.key, required this.constellation});

  final Constellation constellation;

  @override
  State<ConstellationPage> createState() => _ConstellationPageState();
}

class _ConstellationPageState extends State<ConstellationPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
