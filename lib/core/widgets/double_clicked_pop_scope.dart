import '../helpers/dialogs_helper.dart';
import '../helpers/extensions.dart';
import 'package:flutter/material.dart';

class DoubleClickedPopScope extends StatefulWidget {
  final Widget child;
  const DoubleClickedPopScope({super.key, required this.child});

  @override
  State<DoubleClickedPopScope> createState() => _DoubleClickedPopScopeState();
}

class _DoubleClickedPopScopeState extends State<DoubleClickedPopScope> {
  DateTime? _lastBackPressTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final now = DateTime.now();
        if (_lastBackPressTime == null ||
            now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
          _lastBackPressTime = now;
          DialogsHelper.showBasicToast('اضغط رجوع مرة اخرى للخروج');
        } else {
          context.pop();
        }
      },
      child: widget.child,
    );
  }
}
