class ApiCallListener {
  const ApiCallListener({
    this.onSuccess,
    this.onError,
    this.onCompleted,
  });
  final Function()? onSuccess;
  final Function(String error)? onError;
  final Function()? onCompleted;

  void call([String? error]) {
    if (error == null) {
      if (onSuccess != null) onSuccess!();
    } else {
      if (onError != null) onError!(error);
    }
    if (onCompleted != null) onCompleted!();
  }

  // /// error handled and returns whether success or not
  // /// `true` success
  // /// `false` failure
  // bool handleApiResponse(
  //   int statusCode, {
  //   Map<String, dynamic>? json,
  // }) {
  //   if (statusCode == 403) {
  //     BottomStatusPage.tokenExpired();
  //   } else if (statusCode < 400) {
  //     if (onSuccess != null) onSuccess!();
  //     if (onCompleted != null) onCompleted!();
  //     return true;
  //   } else if (statusCode < 500) {
  //     final error = json == null
  //         ? "Unhandled Error"
  //         : json["data"]["message"] ?? "Unhandled Error";
  //     if (onError != null) onError!(error);
  //   } else {
  //     final error =
  //         'ServerError: ${(json == null ? "Unhandled Error" : json["data"]["message"] ?? "Unhandled Error")}';
  //     if (onError != null) onError!(error);
  //   }
  //   if (onCompleted != null) onCompleted!();
  //   return false;
  // }
}
