import 'package:flutter/material.dart';

class ExceptionWidget extends StatelessWidget {
  final String errorText;
  final Function retryFunction;
  const ExceptionWidget({
    super.key,
    required this.retryFunction,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        const Icon(Icons.error, color: Colors.red, size: 75),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            errorText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () => retryFunction(),
            child: const Text(
              'Retry',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
