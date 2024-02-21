import 'package:currency_converter/bloc/currency/bloc.dart';
import 'package:currency_converter/data/models/shared/currency_historical_data_model.dart';
import 'package:currency_converter/ui/common/components/genearic_state.dart';
import 'package:currency_converter/ui/modules/currency_converter/controller/currency_converter_state.dart';
import 'package:currency_converter/ui/style/app_colors.dart';
import 'package:currency_converter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalExchangeRate extends StatelessWidget {
  const HistoricalExchangeRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesBloc, CurrenciesState>(
      buildWhen: (previous, current) =>
          current is GetHistoricalDataLoadedState || current is GetHistoricalDataErrorState || current is GetHistoricalDataLoadingState,
      builder: (context, state) {
        if (state is GetHistoricalDataLoadedState) {
          return Column(
            children: List.generate(
                state.exchangeCurrencyData.length,
                (index) => Row(
                      children: [
                        Text(
                          (index + 1).toString(),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black, fontWeight: FontWeight.w500),
                        ),
                        Text(state.exchangeCurrencyData[index].datetime)
                      ],
                    )),
          );
        } else if (state is GetHistoricalDataErrorState) {
          return GenericState(
              state: GenericStateTypes.ERROR,
              onPress: () {
                BlocProvider.of<CurrenciesBloc>(context).add(GetHistoricalData(
                    startDate: DateTime.now().toIso8601String(),
                    endDate: DateTime.now().subtract(const Duration(days: 7)).toIso8601String(),
                    baseCurrency:
                        BlocProvider.of<CurrencyConverterCubit>(context).selectedBaseCurrency?.code ?? Constants.defaultBaseCurrency,
                    targetCurrency:
                        BlocProvider.of<CurrencyConverterCubit>(context).selectedTargetCurrency?.code ?? Constants.defaultBaseCurrency));
              });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
