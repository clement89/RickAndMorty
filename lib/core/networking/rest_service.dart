import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rick_morty/core/logs/log_service.dart';
import 'package:rick_morty/di/injection_container.dart';

class RestService {
  final int timeOut = 20;
  final String _baseUrl = 'https://rickandmortyapi.com/api/';

  Future<Map<String, String>> _getAuthHeader() async {
    return {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };
  }

  final logService = serviceLocator<LogService>();

  Future<ApiResponse> getDataFromServer({
    required String url,
    Map<String, String>? header,
  }) async {
    logService.logInfo('GET --------- ${_baseUrl + url}');
    Map<String, String> header0 = await _getAuthHeader();
    try {
      http.Response response = await http.get(
        Uri.parse(_baseUrl + url),
        headers: {
          ...header0,
          ...?header,
        },
      ).timeout(Duration(seconds: timeOut), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      logService.logInfo('statue code --- ${response.statusCode}');

      // logService.logInfo('data --- ${response.body}');

      if (response.statusCode == 200) {
        // var data = json.decode(response.body.toString()) as dynamic;

        if (response.body.isEmpty) {
          return ApiResponse(isError: false, data: response.body);
        }

        var data = json.decode(utf8.decode(response.bodyBytes)) as dynamic;

        return ApiResponse(isError: false, data: data);
      } else {
        String msg = '';
        try {
          var data = json.decode(utf8.decode(response.bodyBytes)) as dynamic;
          msg = data['message'] ?? 'Error getting response from server';
        } catch (e) {
          // dPrint('Error - > $e');
        }
        return ApiResponse(
          isError: true,
          errorMessage: msg,
        );
      }
    } on SocketException {
      return ApiResponse(
        isError: true,
        errorMessage: 'No internet connection',
      );
    } on TimeoutException catch (_) {
      return ApiResponse(
        isError: true,
        errorMessage: 'The connection has timed out, Please try again!',
      );
    }
  }

  Future<ApiResponse> createRecordOnServer({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> header,
  }) async {
    logService.logInfo('POST --------- $url');
    logService.logInfo('body --------- $body');
    // dPrint('header --------- $header');
    Map<String, String> header0 = await _getAuthHeader();

    try {
      var bodyNew = json.encode(body);

      http.Response response = await http.post(
        Uri.parse(_baseUrl + url),
        body: bodyNew,
        headers: {
          ...header0,
          ...header,
        },
      ).timeout(Duration(seconds: timeOut), onTimeout: () {
        // Time has run out, do what you wanted to do.
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      logService.logInfo('response - ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        return ApiResponse(isError: false, data: jsonResponse) as dynamic;
      } else {
        String msg = '';
        try {
          var data = json.decode(utf8.decode(response.bodyBytes)) as dynamic;
          msg = data['message'] ?? 'Error getting response from server';
        } catch (e) {
          logService.logInfo('Error - > $e');
        }
        return ApiResponse(
          isError: true,
          errorMessage: msg,
        );
      }
    } on SocketException {
      return ApiResponse(
        isError: true,
        errorMessage: 'No internet connection',
      );
    } on TimeoutException catch (_) {
      return ApiResponse(
        isError: true,
        errorMessage: 'The connection has timed out, Please try again!',
      );
    }
  }

  Future<ApiResponse> putRecordOnServer({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> header,
  }) async {
    logService.logInfo('POST --------- $url');
    logService.logInfo('body --------- $body');
    // dPrint('header --------- $header');
    Map<String, String> header0 = await _getAuthHeader();

    try {
      var bodyNew = json.encode(body);

      http.Response response = await http.put(
        Uri.parse(_baseUrl + url),
        body: bodyNew,
        headers: {
          ...header0,
          ...header,
        },
      ).timeout(Duration(seconds: timeOut), onTimeout: () {
        // Time has run out, do what you wanted to do.
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      logService.logInfo('response - ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        return ApiResponse(isError: false, data: jsonResponse) as dynamic;
      } else {
        String msg = '';
        try {
          var data = json.decode(utf8.decode(response.bodyBytes)) as dynamic;
          msg = data['message'] ?? 'Error getting response from server';
        } catch (e) {
          logService.logInfo('Error - > $e');
        }
        return ApiResponse(
          isError: true,
          errorMessage: msg,
        );
      }
    } on SocketException {
      return ApiResponse(
        isError: true,
        errorMessage: 'No internet connection',
      );
    } on TimeoutException catch (_) {
      return ApiResponse(
        isError: true,
        errorMessage: 'The connection has timed out, Please try again!',
      );
    }
  }

  Future<ApiResponse> updateRecordOnServer({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> header,
  }) async {
    logService.logInfo('PUT --------- $url');
    try {
      var bodyNew = json.encode(body);
      Map<String, String> header0 = await _getAuthHeader();

      http.Response response = await http.put(Uri.parse(_baseUrl + url),
          body: bodyNew,
          headers: {
            ...header0,
            ...header
          }).timeout(Duration(seconds: timeOut), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        return ApiResponse(isError: false, data: jsonResponse) as dynamic;
      } else {
        String msg = '';
        try {
          var data = json.decode(utf8.decode(response.bodyBytes)) as dynamic;
          msg = data['message'] ?? 'Error getting response from server';
        } catch (e) {
          logService.logInfo('Error - > $e');
        }
        return ApiResponse(
          isError: true,
          errorMessage: msg,
        );
      }
    } on SocketException {
      return ApiResponse(
        isError: true,
        errorMessage: 'No internet connection',
      );
    } on TimeoutException catch (_) {
      return ApiResponse(
        isError: true,
        errorMessage: 'The connection has timed out, Please try again!',
      );
    }
  }

  Future<ApiResponse> patchRecordOnServer({
    required String url,
    Map<String, dynamic>? body,
    required Map<String, String> header,
  }) async {
    logService.logInfo('PATCH --------- $url');
    try {
      Map<String, String> header0 = await _getAuthHeader();

      var bodyNew = json.encode(body ?? {});
      http.Response response = await http.patch(Uri.parse(_baseUrl + url),
          body: bodyNew,
          headers: {
            ...header0,
            ...header
          }).timeout(Duration(seconds: timeOut), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      logService.logInfo('statue code --- ${response.statusCode}');

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        return ApiResponse(isError: false, data: jsonResponse) as dynamic;
      } else {
        String msg = '';
        try {
          var data = json.decode(utf8.decode(response.bodyBytes)) as dynamic;
          msg = data['message'] ?? 'Error getting response from server';
        } catch (e) {
          logService.logError('Error - > $e');
        }
        return ApiResponse(
          isError: true,
          errorMessage: msg,
        );
      }
    } on SocketException {
      return ApiResponse(
        isError: true,
        errorMessage: 'No internet connection',
      );
    } on TimeoutException catch (_) {
      return ApiResponse(
        isError: true,
        errorMessage: 'The connection has timed out, Please try again!',
      );
    }
  }

  Future<ApiResponse> deleteRecordFromServer({
    required String url,
    required Map<String, String> header,
    Map<String, dynamic>? body,
  }) async {
    try {
      logService.logInfo('DELETE --------- $url');
      var bodyNew = json.encode(body ?? {});
      Map<String, String> header0 = await _getAuthHeader();

      http.Response response = await http.delete(Uri.parse(_baseUrl + url),
          body: bodyNew,
          headers: {
            ...header0,
            ...header
          }).timeout(Duration(seconds: timeOut), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      logService.logInfo('statue code --- ${response.statusCode}');

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        return ApiResponse(isError: false, data: jsonResponse) as dynamic;
      } else {
        String msg = '';
        try {
          var data = json.decode(utf8.decode(response.bodyBytes)) as dynamic;
          msg = data['message'] ?? 'Error getting response from server';
        } catch (e) {
          logService.logInfo('Error - > $e');
        }
        return ApiResponse(
          isError: true,
          errorMessage: msg,
        );
      }
    } on SocketException {
      return ApiResponse(
        isError: true,
        errorMessage: 'No internet connection',
      );
    } on TimeoutException catch (_) {
      return ApiResponse(
        isError: true,
        errorMessage: 'The connection has timed out, Please try again!',
      );
    }
  }
}

class ApiResponse {
  bool isError;
  String? errorMessage;
  dynamic data;

  ApiResponse({
    required this.isError,
    this.errorMessage,
    this.data,
  });
}
