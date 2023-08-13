// import 'dart:convert';
// import 'dart:developer';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:woocom_app/core/constants/end_points.dart';
// import '../../config/env.dart';
// import '../../config/routes.dart';
// import '../../constants/messages.dart';
// import '../../shared/loader.dart';
// import '../../shared/shared_error.dart';
// import '../shared_preferences.dart';
// import 'api_request_logger.dart';
// import 'api_response_model.dart';
//
// class ApiService {
//   static final ApiService _apiUtil = ApiService._();
//   ApiService._();
//   factory ApiService() {
//     return _apiUtil;
//   }
//
//   final _dio = Dio();
//
//   void init() {
//     _dio.options.baseUrl = kAppConfig['is_live_mode']
//         ? kAppConfig['live_api']
//         : kAppConfig['test_api'];
//     _dio.options.connectTimeout = 60000;
//     _dio.options.receiveTimeout = 60000;
//     if (!kReleaseMode) {
//       _dio.interceptors.add(
//         AppDioLogger(
//           requestBody: true,
//         ),
//       );
//     }
//   }
//
//   Future request<T>(String endPoint, String method,
//       {dynamic data,
//       Map<String, dynamic>? queryParameters,
//       String contentType = "multipart/form-data",
//       Function(String successMsg)? successMessage,
//       Function(String errorMsg)? backEndError,
//       Function(String errorMsg)? unKnownError,
//       bool isFormData = true,
//       bool showLoading = false,
//       bool returnAppResponseModel = false,
//       bool returnResponseBody = true,
//       bool logTheRequest = false}) async {
//     try {
//       if (queryParameters != null) {
//         queryParameters = <String, dynamic>{};
//       }
//       if (showLoading) {
//         Loader.start();
//       }
//       var connectivityResult = await (Connectivity().checkConnectivity());
//       bool internetConnectionChecker =
//           await InternetConnectionChecker().hasConnection;
//
//       if (connectivityResult == ConnectivityResult.mobile ||
//           connectivityResult == ConnectivityResult.wifi ||
//           internetConnectionChecker) {
//         var headers = {"Accept": "application/json"};
//
//         // Add Basic Authentication header
//         String username = 'ck_a6a7f6cd7b131f9e487d1adea4210aaa358df961';
//         String password = 'cs_70bb270b60caf308ea88aa1a0195558723a4c11c';
//         String basicAuth =
//             'Basic ${base64Encode(utf8.encode("$username:$password"))}';
//
//         if (endPoint == "${EndPoints.users}?slug=${sharedPrefs.username}" ||
//             endPoint == EndPoints.validateToken) {
//           headers['Authorization'] = "Bearer ${sharedPrefs.token}";
//         } else {
//           headers['Authorization'] = basicAuth;
//         }
//
//         Response response = await _dio.request<T>(
//           endPoint,
//           data: isFormData ? FormData.fromMap(data ?? {}) : data,
//           queryParameters: queryParameters,
//           options: Options(
//               method: method,
//               followRedirects: false,
//               contentType: contentType,
//               headers: headers,
//               maxRedirects: 0),
//         );
//         if (showLoading) {
//           Loader.stop();
//         }
//         if (returnResponseBody) {
//           return response.data;
//         }
//         if (response.data != null) {
//           print("data is${response.data}");
//           print("successMessage is$successMessage");
//           print("data2 is${response.data}");
//           final appResponseModel = AppResponseModel.fromMap(response.data);
//           if (returnAppResponseModel) {
//             return appResponseModel;
//           }
//           if (successMessage != null &&
//               response.statusCode! >= 200 &&
//               response.statusCode! <= 400) {
//             successMessage("Success");
//           }
//           if (appResponseModel.errors != null &&
//               response.statusCode! >= 400 &&
//               backEndError != null) {
//             log('message00000000000000000');
//             backEndError(appResponseModel.message.toString());
//           }
//           // if (appResponseModel.token != null) {
//           //   StorageService.saveUserToken(appResponseModel.token!);
//           // }
//           return appResponseModel.data;
//         } else {
//           return response.data;
//         }
//       } else {
//         if (backEndError != null) {
//           backEndError("check your internet connection and try");
//         } else if (unKnownError != null) {
//           unKnownError("check your internet connection and try");
//         } else {
//           showErrorDialog("check your internet connection and try");
//         }
//       }
//     } on DioError catch (e) {
//       log('Errrrrrrorrrrr  ${e.response}');
//       if (showLoading) {
//         Loader.stop();
//       }
//       try {
//         if (e.response != null) {
//           ////final appResponseModel = AppResponseModel.fromMap(e.response! as Map);
//           //log('message is ${appResponseModel.message}');
//           String msg = '';
//           if (e.response!.data['errors'] != null &&
//               e.response!.data['errors'] != true &&
//               e.response!.data['errors'] != false) {
//             if (e.response!.data['errors'] is Map) {
//               e.response!.data['errors'].forEach((key, value) {
//                 msg += value.toString();
//               });
//             } else {
//               msg = msg += e.response!.data['errors'].toString();
//             }
//           }
//           if (e.response!.data['message'] != null) {
//             if (e.response!.data['message'] is Map) {
//               e.response!.data['message'].forEach((key, value) {
//                 msg += value.toString();
//               });
//             } else {
//               msg = msg += e.response!.data['message'].toString();
//             }
//           }
//
//           if (e.response!.statusCode == 401 &&
//               e.response!.data['message'] == "Unauthorized") {
//             // unAuthenticated
//             // clear local user data
//             // force user to login screen
//             showErrorDialog(
//                 'Your session has been ended..You are being redirected to the login page');
//             Future.delayed(const Duration(seconds: 3)).then((value) =>
//                 Navigator.pushNamed(
//                     AppRoutes.navigatorKey.currentContext!, loginScreen));
//           }
//           if (e.response!.statusCode == 406) {
//             // couldn't reach to email address when lognin with facebook
//             // show dialog to enter mail and resend social login request
//             log(e.response!.data['errors']);
//             if (backEndError != null) {
//               backEndError('need email in facebook login');
//             }
//           }
//           // backEnd Error
//           if (backEndError != null) {
//             log(e.response!.data['errors'].toString());
//             backEndError(msg);
//             showErrorDialog(msg);
//           } else {
//             showErrorDialog(msg);
//           }
//         } else {
//           // unknown error { server down - internet error }
//           if (unKnownError != null) {
//             unKnownError(e.response.toString());
//             showErrorDialog(e.response.toString());
//           } else {
//             if (backEndError != null) {
//               backEndError(kExceptionMessage);
//             } else {
//               showErrorDialog(kExceptionMessage);
//             }
//           }
//         }
//         return null;
//       } catch (exp) {
//         if (backEndError != null) {
//           backEndError('An error occurred, please try again later');
//         } else {
//           if (e.response != null) {
//             showErrorDialog(e.response!.data['errors']);
//           }
//         }
//       }
//     }
//     return null;
//   }
// }
