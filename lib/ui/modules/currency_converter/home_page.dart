import 'package:currency_converter/bloc/currency/bloc.dart';
import 'package:currency_converter/ui/common/components/custom_app_bar.dart';
import 'package:currency_converter/ui/common/components/genearic_state.dart';
import 'package:currency_converter/utils/app.localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/currency_converter_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CurrenciesBloc>(context).add(GetAllCurrencies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.translateInstant('currency_converter', defaultText: 'Currency Converter'),
        canPop: false,
      ),
      body: BlocBuilder<CurrenciesBloc, CurrenciesState>(
        buildWhen: (previous, current) {
          return current is CurrenciesLoadedState || current is CurrenciesErrorState || current is CurrenciesLoadingState;
        },
        builder: (context, state) {
          if (state is CurrenciesLoadedState) {
            return CurrencyConverterSection(currencyData: state.currencyData);
          } else if (state is CurrenciesErrorState) {
            return const GenericState(
              state: GenericStateTypes.ERROR,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
