import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:currency_converter/utils/app.localization.dart';
import 'package:flutter/material.dart';

typedef _ListItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  bool isSelected,
  VoidCallback onItemSelect,
);
typedef _HeaderBuilder<T> = Widget Function(
  BuildContext context,
  T selectedItem,
);
typedef _HintBuilder = Widget Function(
  BuildContext context,
  String hint,
);

class CustomDropDownSingleComponent<T> extends StatelessWidget {
  const CustomDropDownSingleComponent(
      {super.key, this.hintText, required this.dropDownList, this.onChanged, this.listItemBuilder, this.headerBuilder, this.hintBuilder});

  final String? hintText;
  final List<T> dropDownList;
  final Function(dynamic)? onChanged;
  final _ListItemBuilder<T>? listItemBuilder;
  final _HeaderBuilder<T>? headerBuilder;
  final _HintBuilder? hintBuilder;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<T>.search(
      headerBuilder: headerBuilder,
      hintText: hintText,
      items: dropDownList,
      searchHintText: AppLocalizations.translateInstant('search_for_currency', defaultText: "Search for currency"),
      listItemBuilder: listItemBuilder,
      hintBuilder: hintBuilder,
      decoration: CustomDropdownDecoration(
          expandedBorder: Border.fromBorderSide(BorderSide(color: AppColors.disabledGrey, width: 1.5)),
          closedBorder: Border.fromBorderSide(BorderSide(color: AppColors.disabledGrey, width: 1.5)),
          headerStyle: TextStyle(color: AppColors.primaryColor),
          listItemStyle: TextStyle(color: AppColors.black),
          searchFieldDecoration:
              SearchFieldDecoration(textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black))),
      onChanged: onChanged,
    );
  }
}
