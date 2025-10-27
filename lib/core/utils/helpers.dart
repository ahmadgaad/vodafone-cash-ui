/// Converts Western Arabic numerals (0-9) to Eastern Arabic numerals (٠-٩)
String toArabicNumbers(dynamic number) {
  const englishDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  String numberString = number.toString();

  for (int i = 0; i < englishDigits.length; i++) {
    numberString = numberString.replaceAll(englishDigits[i], arabicDigits[i]);
  }

  return numberString;
}
