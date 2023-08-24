import 'dart:async';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class DioRequest {
  static final dio = Dio();

  var baseURL = 'https://edamam-recipe-search.p.rapidapi.com';
  var apiKey = 'fb33f05689mshe293eeb423f263ep184f2ejsnb15ea0ee8b86';
  var apiHost = 'edamam-recipe-search.p.rapidapi.com';

  // DioTest({required this.url, required this.method, this.map}) {
  //   requestApi(url, method, map);
  // }

  // Future<Either<FutureOr<Map<String, dynamic>>, String>> requestApi(
  Future<Either<Map<String, dynamic>, String>> requestApi(
      {baseURL, endPoint, method, map, token}) async {
    var response;

    baseURL = baseURL ?? this.baseURL;

    try {
      response = await dio
          .request(baseURL + endPoint,
              options: Options(headers: {
                // "Content-Type": "application/json",
                "X-RapidAPI-Key": apiKey,
                "X-RapidAPI-Host": apiHost,
              }, method: method),
              queryParameters: map)
          .timeout(Duration(seconds: 60));

      return Left(response.data);
    } on DioException catch (e) {
      return Right(e.response?.statusMessage ?? 'Server Error');
    } on TimeoutException catch (e) {
      return Right(e.message ?? 'Timeout Error');
    } on Error catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
    }
  }
}
