import 'package:intl/intl.dart';

String priceFormat(num price) {
  if (price >= 1000) {
    return NumberFormat('#,##0.#').format((price));
  } else {
    return NumberFormat('###.#').format((price));
  }
}

String getFirstName(String fullName) {
  if (fullName.trim().isEmpty) return '';

  final List<String> parts = fullName.trim().split(' ');
  return parts.isNotEmpty ? parts.first : '';
}

String getInitialLetters(String fullName) {
  if (fullName.trim().isEmpty) return '';

  final List<String> parts = fullName.trim().split(RegExp(r'\s+'));
  return parts.map((word) => word[0].toUpperCase()).join();
}

String getPluralOrSingular(String word, int count) {
  if (count > 1) {
    return word + 's';
  } else {
    return word;
  }
}

String getDateFromTimeStamp(String timestamp) {
  final DateTime dateTime = DateTime.parse(timestamp);

  final String formatted = DateFormat('MMM dd').format(dateTime);
  return formatted;
}
