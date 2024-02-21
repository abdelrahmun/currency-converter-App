import 'package:currency_converter/ui/common/components/custom_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitleFormField extends StatelessWidget {
  const TitleFormField({
    Key? key,
    required this.title,
    required this.hint,
    required this.onSave,
    this.controller,
    this.initValue,
    this.focusNode,
    this.nextFocusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.onTap,
    this.validator,
    this.inputFormatters,
    this.minLines = 1,
    this.maxLines = 1,
    this.obscureText = false,
    this.isRequired = false,
    this.enabled = true,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final String title;
  final String hint;
  final Function onSave;
  final int minLines;
  final int maxLines;

  final TextEditingController? controller;
  final String? initValue;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final Function? onTap;
  final Function? validator;
  final List<TextInputFormatter>? inputFormatters;

  final TextInputType textInputType;
  final bool obscureText;
  final bool isRequired;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: enabled ? null : () => onTap?.call(),
          child: FormInputField(
            textEditingController: controller,
            focusNode: focusNode,
            nextFocusNode: nextFocusNode,
            initialValue: initValue,
            onSave: (value) => onSave(value),
            title: title,
            hint: hint,
            enabled: enabled,
            textInputType: textInputType,
            isRequired: isRequired,
            obscureText: obscureText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixText: prefixText,
            minLines: minLines,
            maxLines: maxLines,
            validator: validator,
            inputFormatters: inputFormatters,
          ),
        ),
      ],
    );
  }
}
