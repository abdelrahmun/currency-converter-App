import 'package:currency_converter/bloc/currency/bloc.dart';
import 'package:currency_converter/data/models/shared/exchange_rate.dart';
import 'package:currency_converter/data/models/user/currency_model.dart';
import 'package:currency_converter/ui/common/components/custom_button.dart';
import 'package:currency_converter/ui/common/components/custom_form_input.dart';
import 'package:currency_converter/ui/modules/currency_converter/controller/currency_converter_state.dart';
import 'package:currency_converter/ui/modules/currency_converter/model/data.dart';
import 'package:currency_converter/ui/modules/currency_converter/widgets/historical_exchange_rate.dart';
import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:currency_converter/utils/app.localization.dart';
import 'package:currency_converter/utils/constants.dart';
import 'package:currency_converter/utils/core_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'exchange_currency_result.dart';
import 'single_currency_field.dart';

class CurrencyConverterSection extends StatefulWidget {
  const CurrencyConverterSection({super.key, required this.currencyData});

  final CurrencyData currencyData;

  @override
  State<CurrencyConverterSection> createState() => _CurrencyConverterSectionState();
}

class _CurrencyConverterSectionState extends State<CurrencyConverterSection> {
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
    return BlocProvider<CurrencyConverterCubit>.value(
      value: currencyConverterCubit,
      child: BlocListener<CurrencyConverterCubit, CurrencyConverterStates>(
        listener: (context, state) {
          if (state is ChangeSelectedBaseCurrency || state is ChangeSelectedTargetCurrency) {
            converterData.baseCurrencyFocusNode.requestFocus();
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenAwareWidth(24, context)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              BlocBuilder<CurrencyConverterCubit, CurrencyConverterStates>(buildWhen: (previous, current) {
                return current is ChangeSelectedBaseCurrency;
              }, builder: (context, state) {
                return SingleCurrencyField(
                  currencyData: widget.currencyData,
                  onChanged: (value) {
                    currencyConverterCubit.changeSelectedCurrency(value);
                  },
                );
              }),
              const SizedBox(
                height: 12,
              ),
              Text(
                AppLocalizations.translateInstant('to', defaultText: 'TO'),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.black,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<CurrencyConverterCubit, CurrencyConverterStates>(buildWhen: (previous, current) {
                return current is ChangeSelectedBaseCurrency;
              }, builder: (context, state) {
                return SingleCurrencyField(
                  currencyData: widget.currencyData,
                  onChanged: (value) {
                    currencyConverterCubit.changeTargetCurrency(value);
                  },
                );
              }),
              const SizedBox(
                height: 32,
              ),
              FormInputField(
                  focusNode: converterData.baseCurrencyFocusNode,
                  textInputType: TextInputType.number,
                  textEditingController: converterData.baseCurrency,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
              const SizedBox(
                height: 24,
              ),
              BlocConsumer<CurrenciesBloc, CurrenciesState>(listener: (context, state) {
                if (state is ExchangeRateLoadedState) {
                  final double amount = double.tryParse(converterData.baseCurrency.text) ?? 1;
                  currencyConverterCubit.calculateExchangeRate(state.exchangeCurrencyData, amount);
                }
              }, builder: (context, state) {
                return CustomButton(
                    isLoading: state is ExchangeRateLoadingState,
                    onPressed: _onPressConvert,
                    label: AppLocalizations.translateInstant('convert', defaultText: 'Convert'));
              }),
              const SizedBox(
                height: 12,
              ),
              const ExchangeCurrencyResult(),
              const SizedBox(
                height: 24,
              ),

              // HistoricalExchangeRate()
            ],
          ),
        ),
      ),
    );
  }

  _onPressConvert() {
    if (currencyConverterCubit.selectedBaseCurrency == null) {
      Utils.showToast(
          message: AppLocalizations.translateInstant('please_select_base_currency', defaultText: "Please select Base Currency"),
          state: SnackBarStates.ERROR);
      return;
    } else if (currencyConverterCubit.selectedTargetCurrency == null) {
      Utils.showToast(
          message: AppLocalizations.translateInstant('please_select_target_currency', defaultText: "Please select Target Currency"),
          state: SnackBarStates.ERROR);
      return;
    } else if (converterData.baseCurrency.text.trim().isEmpty) {
      Utils.showToast(
          message: AppLocalizations.translateInstant('please_enter_amount', defaultText: "Please enter Amount"),
          state: SnackBarStates.ERROR);
      return;
    }

    BlocProvider.of<CurrenciesBloc>(context)
        .add(GetExchangeRate(baseCurrency: currencyConverterCubit.selectedBaseCurrency?.code ?? Constants.defaultBaseCurrency));

    // final startDate = DateTime.now().subtract(const Duration(days: 7));
    // String formattedStartDate = DateFormat('yyyy-MM-dd').format(startDate);
    //
    // final endDate = DateTime.now().subtract(const Duration(days: 7));
    // String formattedEndDate = DateFormat('yyyy-MM-dd').format(endDate);
    // //
    // BlocProvider.of<CurrenciesBloc>(context).add(GetHistoricalData(
    //     endDate: formattedStartDate,
    //     startDate: formattedEndDate,
    //     baseCurrency: currencyConverterCubit.selectedBaseCurrency?.code ?? Constants.defaultBaseCurrency,
    //     targetCurrency: currencyConverterCubit.selectedTargetCurrency?.code ?? Constants.defaultBaseCurrency));
  }
}
