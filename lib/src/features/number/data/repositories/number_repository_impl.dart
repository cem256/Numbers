import 'package:dio/dio.dart';
import 'package:numbers/src/core/core.dart';
import 'package:numbers/src/features/number/number.dart';

class NumberRepositoryImpl implements NumberRepository {
  const NumberRepositoryImpl({required NumbersApiService service})
      : _numbersApiService = service;
  final NumbersApiService _numbersApiService;

  @override
  Future<DataState<Number>> getNumber(NumberRequestParams params) async {
    try {
      final response = await _numbersApiService.getNumber(params: params);

      return DataSuccess(response.toEntity());
    } on DioException catch (e) {
      return DataFailure(
        ErrorDetails(
          message: e.message ?? '',
          error: '',
          stackTrace: '',
        ),
      );
    }
  }

  @override
  Future<DataState<Number>> getRandomNumber() async {
    try {
      final response = await _numbersApiService.getRandomNumber();

      return DataSuccess(response.toEntity());
    } on DioException catch (e) {
      return DataFailure(
        ErrorDetails(
          message: e.message ?? '',
          error: '',
          stackTrace: '',
        ),
      );
    }
  }
}
