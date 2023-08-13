// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:developer';

class AppResponseModel {
  dynamic data;
  String? message;
  int? status;
  dynamic errors;

  AppResponseModel({
    required this.data,
    this.message,
    this.status,
    required this.errors,
  });

  factory AppResponseModel.fromMap(Map<dynamic, dynamic> map) {
    String errorMessage = '';
    String msg = '';
    try {
      if (map['errors'] != null) {
        if (map['errors'] is String) {
          errorMessage = map['errors'];
        } else if (map['errors'] is Map) {
          map['errors'].forEach((key, value) {
            if (key == 'message') {
              errorMessage += value;
            }
          });
          log('errorMsg. $errorMessage');
        } else {
          errorMessage = map['errors'].toString();
        }
      }
    } catch (_) {}

    try {
      if (map['message'] != null) {
        msg = map['message'].toString();
      } else if (map['message'] is Map) {
        map['message'].forEach((key, value) {
          if (key == 'message') {
            msg += value.toString();
          }
        });
        log('msg. $msg');
      }
    } catch (_) {}

    return AppResponseModel(
        data: map['data'],
        message: msg,
        errors: errorMessage,
        status: map['status']);
  }
}
