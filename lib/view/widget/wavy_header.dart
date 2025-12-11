import 'package:flutter/material.dart';
import 'package:login/core/colors/app_colors.dart';

import 'package:flutter/widgets.dart';
import '../../view/widget/header_clipper.dart';
class WavyHeader extends StatelessWidget {
  final double height;

  const WavyHeader({super.key, this.height = 240});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.lightBlue],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
      ),
    );
  }
}