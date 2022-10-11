import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ConnectionHelper {
  Future<Response<dynamic>?> getData(
    String url, {
    Map<String, dynamic>? query,
  }) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      // Request to API
      var response = await dio.get(url,
          queryParameters: query,
          options: Options(
            sendTimeout: 10000,
            receiveTimeout: 10000,
          ));

      // Ending Timer
      DateTime etime = DateTime.now();

      // Calculating Time
      Duration diff = etime.difference(stime);

      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      print(error);
      return error.response;
    }
  }

  // Future<Response<dynamic>?> getDataWithHeaders(
  //   String url, {
  //   Map<String, dynamic>? queryData,
  // }) async {
  //   try {
  //     // Starting Timer
  //     DateTime stime = DateTime.now();
  //     // final prefs = await SharedPreferences.getInstance();
  //
  //     Map<String, dynamic> headers = {
  //       API.headersAgentId: prefs.getString(SF.agentId),
  //       API.headersAgentToken: url == API.getRefreshToken
  //           ? prefs.getString(SF.refreshToken)
  //           : prefs.getString(SF.accessToken)
  //     };
  //
  //     Dio dio = Dio();
  //     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //         (HttpClient client) {
  //       client.badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //       return client;
  //     };
  //
  //     var response = await dio.get(
  //       url,
  //       queryParameters: queryData,
  //       options: Options(
  //         headers: headers,
  //         contentType: Headers.jsonContentType,
  //         sendTimeout: 10000,
  //         receiveTimeout: 10000,
  //       ),
  //     );
  //
  //     // Ending Timer
  //     DateTime etime = DateTime.now();
  //
  //     // Calculating Time
  //     Duration diff = etime.difference(stime);
  //
  //     // Printing Results
  //     print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");
  //
  //     return response;
  //   } on DioError catch (error) {
  //     if (error.response != null) {
  //       if (error.response!.statusCode == 403) {
  //         final prefs = await SharedPreferences.getInstance();
  //         dynamic refreshHeaders = {
  //           API.headersAgentId: prefs.getString(SF.agentId),
  //           API.headersAgentToken: prefs.getString(SF.refreshToken),
  //         };
  //         var refresh = await getRefreshToken(refreshHeaders);
  //         if (refresh != null && refresh.statusCode! == 200) {
  //           var apiData = refresh.data;
  //           String accessToken = apiData["data"]["token"]["access_token"];
  //           String refreshToken = apiData["data"]["token"]["refresh_token"];
  //           prefs.setString(SF.accessToken, accessToken);
  //           prefs.setString(SF.refreshToken, refreshToken);
  //           var responseAgain = await getDataWithHeaders(url);
  //           return responseAgain;
  //         }
  //       }
  //       return error.response;
  //     } else {
  //       print(error);
  //     }
  //   }
  //   return null;
  // }

  Future<Response<dynamic>?> postData(String url, dynamic data) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var response = await dio.post(url,
          data: data,
          options: Options(
              contentType: Headers.jsonContentType,
              sendTimeout: 10000,
              receiveTimeout: 10000));

      // Ending Timer
      DateTime etime = DateTime.now();

      // Calculating Time
      Duration diff = etime.difference(stime);

      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        return error.response;
      } else {
        print(error);
      }
    }
    return null;
  }

  Future<Response<dynamic>?> putData(
    String url,
    dynamic data, {
    Map<String, dynamic>? headers,
    String? userAuth,
  }) async {
    try {
      // Starting Timer
      DateTime sTime = DateTime.now();

      var response = await Dio().put(
        url,
        data: data,
        options: Options(
            contentType: Headers.jsonContentType,
            sendTimeout: 10000,
            receiveTimeout: 10000),
      );

      // Ending Timer
      DateTime eTime = DateTime.now();
      // Calculating Time
      Duration diff = eTime.difference(sTime);
      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        return error.response;
      } else {
        print(error);
      }
    }
    return null;
  }

  Future<Response<dynamic>?> transmitter(String url, dynamic data) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      var response = await dio.post(
        url,
        data: data,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {"SECRET-KEY": "GYGWYERY58454FDS4FD8V487FF8WQ8EF11D88W1D"},
          sendTimeout: 10000,
          receiveTimeout: 10000,
        ),
      );

      // Ending Timer
      DateTime etime = DateTime.now();

      // Calculating Time
      Duration diff = etime.difference(stime);

      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        return error.response;
      } else {
        print(error);
      }
    }
    return null;
  }

  // Future<Response<dynamic>?>? postDataWithHeaders(
  //   String url,
  //   dynamic data,
  // ) async {
  //   try {
  //     // Starting Timer

  //     DateTime stime = DateTime.now();
  //     final prefs = await SharedPreferences.getInstance();
  //
  //     Map<String, dynamic> headers = {
  //       API.headersAgentId: prefs.getString(SF.agentId),
  //       API.headersAgentToken: url == API.getRefreshToken
  //           ? prefs.getString(SF.refreshToken)
  //           : prefs.getString(SF.accessToken)
  //     };
  //
  //     Dio dio = Dio();
  //     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //         (HttpClient client) {
  //       client.badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //       return client;
  //     };
  //
  //     var response = await dio.post(
  //       url,
  //       data: data,
  //       options: Options(
  //         headers: headers,
  //         contentType: Headers.jsonContentType,
  //         sendTimeout: 10000,
  //         receiveTimeout: 10000,
  //       ),
  //     );
  //
  //     // Ending Timer
  //     DateTime etime = DateTime.now();
  //
  //     // Calculating Time
  //     Duration diff = etime.difference(stime);
  //
  //     // Printing Results
  //     print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");
  //
  //     return response;
  //   } on DioError catch (error) {
  //     if (error.response != null) {
  //       if (error.response!.statusCode == 403) {
  //         final prefs = await SharedPreferences.getInstance();
  //         dynamic refreshHeaders = {
  //           API.headersAgentId: prefs.getString(SF.agentId),
  //           API.headersAgentToken: prefs.getString(SF.refreshToken),
  //         };
  //         var refresh = await getRefreshToken(refreshHeaders);
  //         if (refresh != null && refresh.statusCode! == 200) {
  //           var apiData = refresh.data;
  //           String accessToken = apiData["data"]["token"]["access_token"];
  //           String refreshToken = apiData["data"]["token"]["refresh_token"];
  //           prefs.setString(SF.accessToken, accessToken);
  //           prefs.setString(SF.refreshToken, refreshToken);
  //           var responseAgain = await postDataWithHeaders(url, data);
  //           return responseAgain;
  //         }
  //       }
  //       return error.response;
  //     } else {
  //       print(error);
  //     }
  //   }
  //   return null;
  // }
  //
  // Future<Response<dynamic>?>? getRefreshToken(dynamic headers) async {
  //   try {
  //     // Starting Timer
  //     DateTime stime = DateTime.now();
  //
  //     Dio dio = Dio();
  //     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //         (HttpClient client) {
  //       client.badCertificateCallback =
  //           (X509Certificate cert, String host, int port) => true;
  //       return client;
  //     };
  //
  //     var response = await dio.get(
  //       API.getRefreshToken,
  //       options: Options(
  //           headers: headers,
  //           contentType: Headers.jsonContentType,
  //           sendTimeout: 10000,
  //           receiveTimeout: 10000),
  //     );
  //
  //     // Ending Timer
  //     DateTime etime = DateTime.now();
  //
  //     // Calculating Time
  //     Duration diff = etime.difference(stime);
  //
  //     // Printing Results
  //     print(API.getRefreshToken +
  //         ": " +
  //         diff.inMilliseconds.toString() +
  //         " Milliseconds");
  //
  //     return response;
  //   } on DioError catch (error) {
  //     if (error.response != null) {
  //       print(error.response);
  //     }
  //   }
  //   return null;
  // }
}
