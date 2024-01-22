import 'package:intern_test/utils/api_callback_listener.dart';

class ApiCallHandler {
  /// error handled and returns whether success or not
  /// `true` success
  /// `false` failure
  static bool handleApiResponse(
    int statusCode, {
    ApiCallListener? listener,
    Map<String, dynamic>? json,
  }) {
    if (statusCode < 400) {
      if (listener?.onSuccess != null) listener?.onSuccess!();
      if (listener?.onCompleted != null) listener?.onCompleted!();
      return true;
    } else if (statusCode < 500) {
      final error = (json == null)
          ? "Unhandled Error"
          : json["message"] ?? "Unhandled Error";
      if (listener?.onError != null) listener?.onError!(error);
    } else {
      final error =
          'ServerError: ${(json == null ? "Unhandled Error" : json["message"] ?? "Unhandled Error")}';
      if (listener?.onError != null) listener?.onError!(error);
    }
    if (listener?.onCompleted != null) listener?.onCompleted!();
    return false;
  }
}
