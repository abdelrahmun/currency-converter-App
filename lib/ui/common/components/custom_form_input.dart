import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:currency_converter/utils/app.localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInputField extends StatefulWidget {
  final String title;
  final String hint;
  final TextInputType? textInputType;
  final Function? onSave;
  final Function? onDoneTapped;
  final Function? onChanged;
  final Function? validator;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final bool isRequired;
  final bool enabled;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final String? initialValue;
  final Color? backgroundColor;
  final TextStyle? style;
  final InputDecoration? inputDecoration;
  final double contentHorizPadding;
  final double contentTopPadding;
  final double contentBottomPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Color fillColor;
  final int minLines;
  final int maxLines;
  final double cornerRadius;
  final double elevation;
  final double vertMargin;
  final double horizMargin;
  final String? prefixText;

  const FormInputField({
    this.title = '',
    this.hint = '',
    this.textInputType,
    this.onSave,
    this.onDoneTapped,
    this.validator,
    this.textEditingController,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.isRequired = false,
    this.enabled = true,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.labelStyle,
    this.initialValue,
    this.fillColor = Colors.white,
    this.minLines = 1,
    this.maxLines = 1,
    this.elevation = 0,
    this.backgroundColor,
    this.style,
    this.onChanged,
    this.inputDecoration,
    this.cornerRadius = 10,
    this.vertMargin = 0,
    this.horizMargin = 0,
    this.contentHorizPadding = 12,
    this.contentTopPadding = 12,
    this.contentBottomPadding = 12,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.inputFormatters,
    this.maxLength,
    this.prefixText,
    Key? key,
  }) : super(key: key);

  @override
  State<FormInputField> createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: widget.vertMargin, horizontal: widget.horizMargin),
      child: TextFormField(
        enabled: widget.enabled,
        key: Key(widget.title),
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        initialValue: widget.initialValue,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged != null ? (value) => widget.onChanged!(value) : (value) {},
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        keyboardType: widget.textInputType ?? TextInputType.text,
        validator: widget.validator != null
            ? (value) => widget.validator!(value)
            : (value) {
                if (widget.isRequired) {
                  if (value == null || value.isEmpty) {
                    return '${widget.title} ${AppLocalizations.translateInstant('is_required', defaultText: 'is Required')}';
                  }
                  return null;
                } else {
                  return null;
                }
              },
        onSaved: widget.onSave != null ? (value) => widget.onSave!(value) : (value) {},
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        style: widget.style ?? Theme.of(context).textTheme.bodyMedium,
        textInputAction: widget.minLines > 1
            ? TextInputAction.newline
            : widget.textInputAction ?? (widget.nextFocusNode != null ? TextInputAction.next : TextInputAction.done),
        onEditingComplete: () {
          if (widget.focusNode != null) widget.focusNode!.unfocus();

          widget.onDoneTapped ??
              () {
                try {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }
                } catch (e) {
                  debugPrint('Error in (onDoneTapped)FormField: $e');
                }
              };
        },
        onFieldSubmitted: (term) {
          if (widget.focusNode != null) widget.focusNode!.unfocus();
          if (widget.nextFocusNode != null) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
        },
        decoration: widget.inputDecoration ??
            InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isCollapsed: true,
              filled: true,
              fillColor: widget.fillColor,
              prefixIcon: widget.prefixIcon != null
                  ? ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 20, maxHeight: 20), child: widget.prefixIcon)
                  : null,
              label: Text(
                widget.hint,
                maxLines: widget.maxLines,
                style: widget.labelStyle ??
                    Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppColors.lightGrey, fontWeight: FontWeight.w400),
              ),
              suffixIcon: widget.suffixIcon,
              counterText: '',
              prefixText: widget.prefixText ?? '',
              prefixStyle: widget.style ?? Theme.of(context).textTheme.displaySmall,
              // constraints: widget.maxLines > 1 ? null : const BoxConstraints(maxHeight: 44),
              contentPadding: EdgeInsets.only(
                left: widget.contentHorizPadding,
                right: widget.contentHorizPadding,
                top: widget.prefixIcon != null ? 14 : widget.contentTopPadding,
                bottom: widget.contentTopPadding,
              ),
              border: widget.enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.greyBorderColor),
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                  ),
              focusedBorder: widget.enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                  ),
              enabledBorder: widget.enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.lightGrey,
                    ),
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                  ),
              disabledBorder: widget.enabledBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.greyBorderColor),
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                  ),
              errorBorder: widget.errorBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                  ),
              focusedErrorBorder: widget.errorBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                  ),
              errorMaxLines: 2,
            ),
      ),
    );
  }
}
