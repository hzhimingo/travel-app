class NumberConvert {
  static String convertNumberToString(int number) {
    if (number <= 999) {
      return '$number';
    }
    if (number >= 1000 && number <= 9999) {
      return '${(number / 1000).toStringAsPrecision(2)}k+';
    }
    if (number >= 10000 && number <= 99999) {
      return '${(number / 10000).toStringAsPrecision(2)}w+';
    }
  }
}