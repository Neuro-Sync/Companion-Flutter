import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../resources/app_colors.dart';

class CommonShimmer extends StatelessWidget {
  final Widget child;
  const CommonShimmer({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey,
        period: const Duration(milliseconds: 1000),
        child: child);
  }
}
