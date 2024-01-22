part of 'all_apis.dart';

Future<AuthUserModel?> _loginWithEmail({
  required String username,
  required String password,
  ApiCallListener? listener,
}) async {
  AuthUserModel? res;
  try {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(ApiEndPoints.loginUrl);
    Map body = {
      'username': username,
      'password': password,
    };

    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);

    // print("${response.statusCode} || ${response.body}");

    var json = tryJsonDecode(response.body);

    if (!ApiCallHandler.handleApiResponse(response.statusCode,
        listener: listener, json: json)) return null;

    res = AuthUserModel.fromJson(json);
  } catch (error) {
    debugPrint("login error: $error");
    listener?.call(error.toString());
  }
  return res;
}
