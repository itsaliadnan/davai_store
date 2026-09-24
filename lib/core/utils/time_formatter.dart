class TimeFormatter {
  static String format(DateTime dateTime) {
    final now = DateTime.now();
    final localTime = dateTime.toLocal();
    final difference = now.difference(localTime);

    if (difference.isNegative || difference.inSeconds < 60) {
      return 'الآن';
    }

    if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    }

    if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    }

    if (difference.inDays == 1) {
      return 'أمس';
    }

    final days = difference.inDays;

    if (days < 7) {
      return 'منذ $days أيام';
    }

    if (days < 30) {
      final weeks = days ~/ 7;
      return 'منذ $weeks أسبوع';
    }

    final months = days ~/ 30;

    if (months < 12) {
      return 'منذ $months شهر';
    }

    final years = months ~/ 12;
    return 'منذ $years سنة';
  }
}
