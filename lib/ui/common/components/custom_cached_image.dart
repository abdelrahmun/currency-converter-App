import 'package:currency_converter/ui/common/components/loading_widget.dart';
import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    required this.image,
    this.height = 60,
    this.width = 75,
    this.hasOverlay = false,
    this.fit = BoxFit.cover,
    this.cornerRadius = 10,
    Key? key,
  }) : super(key: key);

  final String image;
  final double height;
  final double width;
  final double cornerRadius;
  final BoxFit fit;
  final bool hasOverlay;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRadius),
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
            colorFilter: hasOverlay ? ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken) : null,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        child: Center(child: LoadingWidget(color: Colors.white, size: height)),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(4),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        child: SvgPicture.asset(
          'assets/icons/image.svg',
          fit: BoxFit.contain,
          color: AppColors.lightGrey,
        ),
      ),
    );
  }
}

class CustomCachedUserImage extends StatelessWidget {
  const CustomCachedUserImage({
    required this.image,
    this.height = 60,
    this.width = 75,
    this.hasOverlay = false,
    this.cornerRadius = 10,
    this.username = 'N/A',
    Key? key,
  }) : super(key: key);

  final String image;
  final double height;
  final double width;
  final double cornerRadius;
  final bool hasOverlay;
  final String username;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRadius),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: hasOverlay ? ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken) : null,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        child: Center(child: LoadingWidget(color: Colors.white, size: height)),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(2),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.disabledColor,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        alignment: Alignment.center,
        child: Text(
          username[0].toString(),
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
