/// Русские формы слова «день».
String executePluralDays(int count) {
  final int absCount = count.abs();
  final int n = absCount % 100;
  final int n1 = n % 10;
  if (n > 10 && n < 20) {
    return 'дней';
  }
  if (n1 == 1) {
    return 'день';
  }
  if (n1 >= 2 && n1 <= 4) {
    return 'дня';
  }
  return 'дней';
}
