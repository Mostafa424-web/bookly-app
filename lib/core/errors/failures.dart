import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure('Connection Timeout with apiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout with apiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timeout with apiServer');

      case DioErrorType.response:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request with apiServer was cancel');
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error , please try later!');
      default:
        return ServerFailure('OPPs There was an error, please try later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request Not Found , please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error , please try later!');
    } else {
      return ServerFailure('OPPs There was an error, please try later!');
    }
  }
}
