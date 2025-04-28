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

  List<String> parts = fullName.trim().split(' ');
  return parts.isNotEmpty ? parts.first : '';
}

String getInitialLetters(String fullName) {
  if (fullName.trim().isEmpty) return '';

  List<String> parts = fullName.trim().split(RegExp(r'\s+'));
  return parts.map((word) => word[0].toUpperCase()).join();
}

String formatDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));

  if (date == today) return 'اليوم ${date.day} ${_monthName(date.month)}';
  if (date == yesterday) return 'أمس ${date.day} ${_monthName(date.month)}';
  return '${date.day} ${_monthName(date.month)}';
}

String _monthName(int month) {
  const months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];
  return months[month - 1];
}
