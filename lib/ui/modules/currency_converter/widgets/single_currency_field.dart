import 'package:currency_converter/data/models/user/currency_model.dart';
import 'package:currency_converter/ui/common/components/custom_drop_down_single_component.dart';
import 'package:currency_converter/ui/common/components/custom_form_input.dart';
import 'package:currency_converter/ui/modules/currency_converter/controller/currency_converter_state.dart';
import 'package:currency_converter/ui/modules/currency_converter/model/data.dart';
import 'package:currency_converter/ui/modules/currency_converter/widgets/currency_drop_down_item_builder.dart';
import 'package:currency_converter/utils/app.localization.dart';
import 'package:currency_converter/utils/core_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCurrencyField extends StatefulWidget {
  const SingleCurrencyField(
      {super.key, this.onChanged, required this.currencyData});

  final CurrencyData currencyData;

  final Function(dynamic)? onChanged;

  @override
  State<SingleCurrencyField> createState() => _SingleCurrencyFieldState();
}

class _SingleCurrencyFieldState extends State<SingleCurrencyField> {
  late final CurrencyConverterCubit currencyConverterCubit;
  late final CurrencyConverterData converterData;

  @override
  void initState() {
    super.initState();

    currencyConverterCubit = CurrencyConverterCubit();
    converterData = CurrencyConverterData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropDownSingleComponent<Currency?>(
      listItemBuilder: (context, item, isSelected, onItemSelect) {
        return CurrencyDropDownItemBuilder(
          currency: item,
        );
      },
      headerBuilder: (context, selectedItem) {
        return CurrencyDropDownItemBuilder(
          currency: selectedItem,
        );
      },
      hintBuilder: (context, hint) {
        return Text(AppLocalizations.translateInstant('select_currency', defaultText: "Select Currency"));
      },
      onChanged: widget.onChanged,
      hintText: '',
      dropDownList: List.generate(widget.currencyData.data?.keys.length ?? 0, (index) {
        final key = widget.currencyData.data?.keys.toList()[index];
        return widget.currencyData.data?[key];
      }),
    );
  }
}
