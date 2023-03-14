import 'package:tesing/common/app_constants.dart';
import 'package:tesing/common/service/api_exception.dart';

class Failure {
  Failure([String? errorMessage])
      : errorMessage = errorMessage ?? AppConstants.unexpectedError;

  final String errorMessage;

  factory Failure.from(Object e) {
    if (e is ApiException) {
      return Failure(e.errorMessage);
    } else {
      return Failure();
    }
  }
}
