import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_result.freezed.dart';

@freezed
class PersonResult<T> with _$PersonResult<T> {
  factory PersonResult.success(List<T> data) = Success;
  factory PersonResult.error(String data) = Error;
}
