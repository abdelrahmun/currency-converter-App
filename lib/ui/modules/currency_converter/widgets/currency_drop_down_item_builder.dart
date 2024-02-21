import 'package:currency_converter/data/models/user/currency_model.dart';
import 'package:currency_converter/ui/common/components/custom_cached_image.dart';
import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyDropDownItemBuilder extends StatelessWidget {
  const CurrencyDropDownItemBuilder({
    super.key,
    required this.currency,
  });

  final Currency? currency;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          CustomCachedImage(
            image: 'https://flagcdn.com/32x24/${(currency?.countries?.firstOrNull ?? '').toLowerCase()}.png',
            height: 20,
            width: 40,
            cornerRadius: 0,
            fit: BoxFit.contain,
            hasOverlay: false,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            currency?.code ?? '',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),
          )
        ],
      ),
    );
  }
}
