import 'package:flutter/material.dart';

class SmallVSpacer extends StatelessWidget {
  const SmallVSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 8);
  }
}

class MediumVSpacer extends StatelessWidget {
  const MediumVSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 16);
  }
}

class LargeVSpacer extends StatelessWidget {
  const LargeVSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 24);
  }
}

class ExtraLargeVSpacer extends StatelessWidget {
  const ExtraLargeVSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 40);
  }
}

class CustomVSpacer extends StatelessWidget {
  const CustomVSpacer(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
