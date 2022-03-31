import 'ResultInterface.dart';

class Failure<T> implements ResultInterface<T> {
  String message;
  T? value;

  Failure(this.message, [this.value = null]) {}

  bool getTag() {
    return false;
  }

  String getMessage() {
    return this.message;
  }

  T? getValue() {
    return this.value;
  }
}
