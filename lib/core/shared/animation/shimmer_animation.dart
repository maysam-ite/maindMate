import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({super.key, required this.loadingShimmerWidget});
final Widget loadingShimmerWidget;
  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.black,
        child:  loadingShimmerWidget,
      );
  }
}