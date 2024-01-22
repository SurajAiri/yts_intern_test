part of 'all_apis.dart';

Future<List<TodoModel>> _fetchTodoList({
  ApiCallListener? listener,
}) async {
  List<TodoModel> res = [];
  try {
    var headers = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse(ApiEndPoints.fetchTodo);

    http.Response response = await http.get(url, headers: headers);

    // print("${response.statusCode} || ${response.body}");

    var json = tryJsonDecode(response.body);

    if (!ApiCallHandler.handleApiResponse(response.statusCode,
        listener: listener, json: json)) return [];

    // res = AuthUserModel.fromJson(json);

    for (var v in json['todos']) {
      res.add(TodoModel.fromJson(v));
    }
  } catch (error) {
    debugPrint("TodoFetch error: $error");
    listener?.call(error.toString());
  }
  return res;
}
