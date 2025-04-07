import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'assets_path.dart' show AssetsPath;

class AppLogo extends StatelessWidget {
  final double? size;
  const AppLogo({
    super.key,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.logosvg, width: size??180,);
  }
}
