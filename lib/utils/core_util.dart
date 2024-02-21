import 'package:currency_converter/utils/app.localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum SnackBarStates { ERROR, SUCCESS, NORMAL }

const double baseHeight = 844.0;
const double baseWidth = 390.0;

double screenAwareHeight(double size, BuildContext context) {
  double drawingHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * drawingHeight / baseHeight;
}

double screenAwareSize(double size, BuildContext context) {
  double drawingHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * drawingHeight / baseHeight;
}

double screenAwareWidth(double size, BuildContext context) {
  double drawingWidth = MediaQuery.of(context).size.width - 16;
  return size * drawingWidth / baseWidth;
}

class Utils {
  static Future<String?> deviceToken() async => await FirebaseMessaging.instance.getToken();

  static showSnackBar({
    required context,
    required String message,
    int duration = 2,
    SnackBarStates state = SnackBarStates.NORMAL,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: duration),
        backgroundColor: state == SnackBarStates.NORMAL
            ? Colors.white
            : state == SnackBarStates.ERROR
                ? Colors.red
                : Colors.green,
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: state == SnackBarStates.NORMAL ? Colors.black : Colors.white,
              ),
        ),
        action: action,
      ),
    );
  }

  static showToast({
    required String message,
    int duration = 2,
    SnackBarStates state = SnackBarStates.NORMAL,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: state == SnackBarStates.NORMAL
          ? Colors.white
          : state == SnackBarStates.ERROR
              ? Colors.red
              : Colors.green,
      textColor: state == SnackBarStates.NORMAL ? Colors.black : Colors.white,
      fontSize: 16.0,
    );
  }

  static showLoaderDialog(BuildContext context, {String message = ''}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          content: Row(
            children: [
              SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Theme.of(context).primaryColor)),
              const SizedBox(width: 12),
              Text(
                '${AppLocalizations.translateInstant('loading', defaultText: 'Loading...')} $message',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        );
      },
    );
  }

  static void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  static bool isDarkMode(context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}
