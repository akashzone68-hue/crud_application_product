import 'package:dio/dio.dart';

class ApiException implements Exception{
  final String message;

  ApiException(this.message);

  factory ApiException.fromDio(DioException error){

    final responseData = error.response?.data;

    if(responseData is Map){
      final message = responseData['message'];

      if(message != null){
        return ApiException(message.toString());
      }

     final errors = responseData['errormessages'];

     if(errors is List && errors.isNotEmpty){
       return ApiException(
         errors
         .map((e) => e['message'].toString())
         .join(),
       );
     }
    }
    if(error.type == DioExceptionType.connectionTimeout || 
      error.type == DioExceptionType.receiveTimeout){
        return ApiException('Connection timeout.');
    }
    if (error.type ==  DioExceptionType.connectionError){
      return ApiException('No internet connection');
    }

    return ApiException(
      error.message ?? 'Something went wrong!',
    );
  }

  @override
  String toString() => message;

}