// import 'package:dio/dio.dart';
//
// import 'exception.dart';

// class FetchResponse<T> {
//   late Status status;
//   late T? data;
//   late int statusCode;
//   late FetchException? exception;
//   late String? message;
//
//   // FetchResponse({
//     this.data,
//     this.message,
//     required this.status,
//     required this.statusCode,
//     this.exception,
//   });
//
//   FetchResponse.completed(this.data, dynamic response) {
//     status = Status.done;
//     statusCode = response['status_code'];
//     message = response['message'] ?? '';
//   }
//
//   FetchResponse.error(DioError error) {
//
//     status = Status.error;
//     exception = error.error;
//     statusCode = error.response?.data?['status_code'] ?? 500;
//     message = error.response?.data['message'] ?? '';
//   }
//
//   @override
//   String toString() {
//     if (exception != null) {
//       return "Status : $status \n Message : $exception \n Data : $data";
//     }
//     return "Status : $status \n Message : $message \n Data : $data";
//   }
// }
//
// enum Status { done, error }
