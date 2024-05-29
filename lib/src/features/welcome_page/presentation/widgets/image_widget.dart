import 'package:flutter/material.dart';
import '../../../../core/config/components/app_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSizedBox extends StatelessWidget {
  const ImageSizedBox({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight / 2,
      child: SvgPicture.asset(welcomePhoto));
  }
}