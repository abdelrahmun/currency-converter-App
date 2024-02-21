import 'package:currency_converter/ui/common/components/custom_button.dart';
import 'package:currency_converter/ui/modules/landing/widgets/custom_radio_button.dart';
import 'package:currency_converter/utils/app.localization.dart';
import 'package:currency_converter/utils/constants.dart';
import 'package:currency_converter/utils/core_util.dart';
import 'package:flutter/material.dart';

class ChangeLanguageSheet extends StatefulWidget {
  const ChangeLanguageSheet({required this.submitLanguage, super.key});

  final Function submitLanguage;

  @override
  State<ChangeLanguageSheet> createState() => _ChangeLanguageSheetState();
}

class _ChangeLanguageSheetState extends State<ChangeLanguageSheet> {
  String selectedLanguage = Constants.englishLocale;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 10,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------->>> Title text <<<----------
                  Text(
                    AppLocalizations.translateInstant('application_language', defaultText: 'Application Language'),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: screenAwareHeight(12, context)),

                  // ---------->>> Desc text <<<----------
                  Text(
                    AppLocalizations.translateInstant('application_language_desc',
                        defaultText: 'You can change the language of use at any time'),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenAwareHeight(12, context)),

                  CustomRadioButton(
                    label: 'اللغة العربية',
                    isSelected: selectedLanguage == Constants.arabicLocale,
                    onTap: () {
                      setState(() {
                        selectedLanguage = Constants.arabicLocale;
                      });
                    },
                  ),
                  CustomRadioButton(
                    label: 'English',
                    isSelected: selectedLanguage == Constants.englishLocale,
                    onTap: () {
                      setState(() {
                        selectedLanguage = Constants.englishLocale;
                      });
                    },
                  ),
                  const SizedBox(height: 24.0),
                  CustomButton(
                    onPressed: () {
                      // BlocProvider.of<AppSettingsBloc>(context).add(ChangeLocalEvent(Locale(selectedLanguage)));
                      widget.submitLanguage();
                    },
                    isLoading: false,
                    label: AppLocalizations.translateInstant('submit', defaultText: 'Submit').toUpperCase(),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
