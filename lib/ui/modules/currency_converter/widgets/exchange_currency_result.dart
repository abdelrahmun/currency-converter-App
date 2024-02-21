import 'package:currency_converter/ui/modules/currency_converter/controller/currency_converter_state.dart';
import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeCurrencyResult extends StatelessWidget {
  const ExchangeCurrencyResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: BlocBuilder<CurrencyConverterCubit, CurrencyConverterStates>(
        buildWhen: (previous, current) {
          return current is CalculateExchangeAmountState;
        },
        builder: (context, state) {
          final amount = BlocProvider.of<CurrencyConverterCubit>(context).exchangeAmount;
          return Center(
            child: Text(
              amount != null
                  ? ("${amount.toStringAsFixed(2)} ${BlocProvider.of<CurrencyConverterCubit>(context).selectedTargetCurrency?.code ?? ''}")
                  : '-',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
    );
  }
}
