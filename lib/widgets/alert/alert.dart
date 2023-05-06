import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class Alert {
  static late BuildContext _context;

  static void init(BuildContext context) {
    _context = context;
  }

  static void _showMessage(String title, QuickAlertType type, String message) {
    QuickAlert.show(
      context: _context,
      type: type,
      title: title,
      text: message,
      backgroundColor: Theme.of(_context).colorScheme.background,
      titleColor: Theme.of(_context).colorScheme.onBackground,
      textColor: Theme.of(_context).colorScheme.onBackground,
      confirmBtnColor: Theme.of(_context).colorScheme.primary,
      confirmBtnText: "Ok",
    );
  }

  static void success(String message) {
    _showMessage("Success", QuickAlertType.success, message);
  }

  static void warning(String message) {
    _showMessage("Warning", QuickAlertType.warning, message);
  }

  static void error(String message) {
    _showMessage("Error", QuickAlertType.error, message);
  }
}
