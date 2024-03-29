import 'package:currency_converter/ui/common/components/custom_button.dart';
import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:currency_converter/utils/app.localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum GenericStateTypes { ERROR, EMPTY }

class GenericState extends StatelessWidget {
  final void Function()? onPress;
  final bool removeButton;

  final String? titleKey;
  final String? bodyKey;
  final String? buttonKey;
  final GenericStateTypes? state;

  final double? fontSize;
  final double size;

  const GenericState({
    Key? key,
    this.state,
    this.onPress,
    this.removeButton = false,
    // this.imagePath,
    this.titleKey,
    this.bodyKey,
    this.buttonKey,
    this.size = 40,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: SvgPicture.asset(
                    state == GenericStateTypes.ERROR ? 'assets/icons/error.svg' : 'assets/icons/empty.svg',
                    fit: BoxFit.contain,
                    width: size,
                    height: size,
                    color: AppColors.lightGrey,
                  ),
                )
              : Container(),
          titleKey != null && titleKey!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    titleKey ?? '',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.black38,
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              : const SizedBox(),
          bodyKey != null && bodyKey!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: (fontSize ?? 24) - 4),
                    child: Text(
                      bodyKey!,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : const SizedBox(),
          removeButton
              ? const SizedBox()
              : SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          isLoading: false,
                          onPressed: onPress ?? () {},
                          label: buttonKey ?? AppLocalizations.translateInstant('try_again', defaultText: 'Try again'),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
