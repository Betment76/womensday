/// Запрос оценки приложения в естественный момент использования.
abstract class AppReviewService {
  /// Учитывает использование и при выполнении условий показывает форму оценки.
  Future<void> executeMaybeRequestReview();
}
