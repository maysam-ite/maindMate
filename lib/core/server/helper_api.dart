import 'dart:convert';

import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:maindmate/core/server/handling_status_code.dart';
import 'package:maindmate/core/server/parse_response.dart';

class ApiHelper {
  /// Static method to make HTTP requests.
  ///
  /// Parameters:
  /// [targetRout] - URL of the API endpoint.
  /// [data] - Data to be sent with the request. Used in POST requests.
  /// [method] - HTTP method ('GET', 'POST', 'PUT', etc.).
  /// [token] - Authentication token, if required.
  /// [files] - Files to be uploaded, if any.
  static Future<Either<ErrorResponse, Map<String, dynamic>>> makeRequest({
    required String targetRout,
    Map<String, dynamic>? data,
    required String method, // 'GET', 'POST', 'PUT', etc.
    String? token, // Optional token
    Map<String, File>? files, // Optional files for upload
  }) async {
    try {
      // HTTP headers, including CORS and content type.
      Map<String, String> headers = {
        // "Access-Control-Allow-Origin": "*",
        // 'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Add authorization token to headers if provided.
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      http.Response response; // Declaration of 'response'

      // Handling file uploads with multipart request.
      if (files != null && files.isNotEmpty) {
        Uri url = Uri.parse(targetRout);
        var request = http.MultipartRequest(method, url);
        request.headers.addAll(headers);

        // Add text fields to the request.
        data?.forEach((key, value) {
          request.fields[key] = value.toString();
        });

        // Add files to the request.
        for (var entry in files.entries) {
          var multipartFile = await http.MultipartFile.fromPath(
              entry.key, entry.value.path,
              contentType: MediaType('application', 'octet-stream'));
          request.files.add(multipartFile);
        }

        // Sending the multipart request and getting the response.
        var streamedResponse = await request.send();
        response = await http.Response.fromStream(streamedResponse);
      } else {
        // Standard handling for non-file-upload requests (GET, POST, etc.).
        Uri url = Uri.parse(targetRout);
        switch (method.toUpperCase()) {
          case 'POST':
            response =
                await http.post(url, body:(data), headers: headers);
            break;
          case 'GET':
            response = await http.get(url, headers: headers);
            break;
          case 'DELETE':
            response = await http.delete(url, headers: headers);
            break;
          default:
            // Handling for unsupported HTTP methods.
            throw UnimplementedError('HTTP method $method not supported');
        }
      }
      print(response.body);
      // Decoding the JSON response.
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      // Handling response based on status code.
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(responseBody);
      } else {
        return Left(ErrorResponse.fromJson(response.statusCode, responseBody));
      }
    } catch (e) {
      // Catching exceptions and returning as error responses.
      return Left(ErrorResponse(
        status: getStatusFromCode(500),
        message: e.toString(),
      ));
    }
  }
}
