import 'package:flutter/material.dart';

class SmallHSpacer extends StatelessWidget {
  const SmallHSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 8);
  }
}

class MediumHSpacer extends StatelessWidget {
  const MediumHSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 16);
  }
}

class LargeHSpacer extends StatelessWidget {
  const LargeHSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 24);
  }
}

class ExtraLargeHSpacer extends StatelessWidget {
  const ExtraLargeHSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 40);
  }
}

class CustomHSpacer extends StatelessWidget {
  const CustomHSpacer(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
