import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:currency_converter/utils/core_util.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final Function onPressed;
  final String label;

  final TextStyle? style;
  final Widget? icon;
  final Color? buttonColor;
  final Color? disabledButtonColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? customBorderColor;
  final Color? buttonStartColor;
  final Color? buttonEndColor;
  final double? customWidth;

  final double customVerticalPadding;
  final double customHorizontalPadding;
  final double cornerRadius;
  final double containerHeight;
  final double borderWidth;
  final bool disabled;

  const CustomButton({
    required this.isLoading,
    required this.onPressed,
    required this.label,
    this.style,
    this.icon,
    this.buttonColor,
    this.disabledButtonColor,
    this.borderColor,
    this.textColor,
    this.customBorderColor,
    this.buttonStartColor,
    this.buttonEndColor,
    this.customWidth,
    this.customVerticalPadding = 12,
    this.customHorizontalPadding = 0,
    this.cornerRadius = 30,
    this.containerHeight = 58,
    this.borderWidth = 2,
    this.disabled = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(splashColor: Colors.white),
      child: SizedBox(
        height: containerHeight,
        child: ElevatedButton(
          onPressed: isLoading || disabled ? null : () => onPressed(),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius),
              side: customBorderColor != null
                  ? BorderSide(color: customBorderColor!, width: borderWidth)
                  : BorderSide.none,
            ),
            elevation: 0,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
          ),
          child: isLoading || disabled
              ? Ink(
                  decoration: BoxDecoration(
                    color: isLoading || disabled
                        ? buttonColor != null
                            ? buttonColor!.withOpacity(0.5)
                            : disabledButtonColor ?? AppColors.disabledColor
                        : buttonColor ?? Theme.of(context).primaryColor,
                    border: Border.all(color: borderColor ?? Colors.transparent, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
                  ),
                  child: Container(
                    height: screenAwareWidth(containerHeight, context),
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(maxHeight: containerHeight),
                    decoration: BoxDecoration(
                      color: isLoading || disabled
                          ? buttonColor != null
                              ? buttonColor!.withOpacity(0.5)
                              : disabledButtonColor ?? AppColors.primaryColor
                          : buttonColor ?? Theme.of(context).primaryColor,
                      border: Border.all(color: borderColor ?? Colors.transparent, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
                    ),
                    child: icon != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              icon!,
                              const SizedBox(width: 4),
                              Text(
                                label,
                                textAlign: TextAlign.center,
                                style: style ??
                                    Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: textColor ?? AppColors.white,
                                        ),
                              ),
                              isLoading && !disabled
                                  ? Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                                      child: Center(
                                        heightFactor: 1,
                                        widthFactor: 1,
                                        child: SizedBox(
                                          height: 14,
                                          width: 14,
                                          child: CircularProgressIndicator(
                                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
                                            strokeWidth: 1.5,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                label,
                                textAlign: TextAlign.center,
                                style: style ??
                                    Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: textColor ?? AppColors.white,
                                        ),
                              ),
                              isLoading && !disabled
                                  ? Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                                      child: Center(
                                        heightFactor: 1,
                                        widthFactor: 1,
                                        child: SizedBox(
                                          height: 14,
                                          width: 14,
                                          child: CircularProgressIndicator(
                                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
                                            strokeWidth: 1.5,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                  ),
                )
              : Ink(
                  decoration: BoxDecoration(
                    color: buttonColor ?? Theme.of(context).primaryColor,
                    border: Border.all(color: borderColor ?? Colors.transparent, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
                  ),
                  child: Container(
                    height: screenAwareWidth(containerHeight, context),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    constraints: BoxConstraints(maxHeight: containerHeight),
                    child: icon != null
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              icon!,
                              const SizedBox(width: 4),
                              Text(
                                label,
                                textAlign: TextAlign.center,
                                style: style ??
                                    Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: textColor ?? AppColors.white,
                                        ),
                              ),
                            ],
                          )
                        : Text(
                            label,
                            textAlign: TextAlign.center,
                            style: style ??
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: textColor ?? AppColors.white,
                                    ),
                          ),
                  ),
                ),
          //color: buttonColor ?? Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
