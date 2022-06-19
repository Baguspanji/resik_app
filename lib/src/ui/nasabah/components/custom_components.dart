import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resik_app/src/config/constans_assets.dart';
import 'package:shimmer/shimmer.dart';

class CustomCacheImageNetworkDecoration extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final String url;
  final AlignmentGeometry? alignment;
  final BoxFit? fit;

  const CustomCacheImageNetworkDecoration(this.url,
      {this.height, this.width, this.radius, this.alignment, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        height: height ?? 60,
        width: width ?? 60,
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 16),
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => CustomShimmer(
        height: height,
        width: width,
        radius: radius,
      ),
      errorWidget: (context, url, error) => Container(
        height: height ?? 60,
        width: width ?? 60,
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconCamera,
              color: Colors.black45,
              width: (width ?? 60) / 5,
            ),
            SizedBox(height: 4),
            Text(
              'Image not found',
              style: TextStyle(
                fontSize: (width ?? 60) / 16,
                color: Colors.black45,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    Key? key,
    required this.height,
    required this.width,
    required this.radius,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white38,
      child: Container(
        height: height ?? 60,
        width: width ?? 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(radius ?? 16),
        ),
      ),
    );
  }
}
