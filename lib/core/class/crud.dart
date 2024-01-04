import 'dart:convert';

import 'package:rimzone_shop/core/class/statusrequest.dart';
import 'package:rimzone_shop/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class Crud {
  var headersList = {'Accept': '*/*', 'Content-Type': 'application/json'};
  Future<Either<StatusRequest, Map<String, dynamic>>> postData(
      String url, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        http.Response response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          // print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> postDataJson(
      String url, Map<String, dynamic> data) async {
    try {
      if (await checkInternet()) {
        http.Response response = await http.post(Uri.parse(url),
            body: jsonEncode(data), headers: headersList);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          // print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}
