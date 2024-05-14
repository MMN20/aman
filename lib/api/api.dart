import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Api {
  var api = 'https://system.aman-iraq.com/api/';
  postData(data, apiUrl) async {
    var fullUrl = api + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = api + apiUrl;
    return await newMethod(fullUrl);
  }

  Future<http.Response> newMethod(String fullUrl) =>
      http.get(Uri.parse(fullUrl), headers: _setHeaders());

  _setHeaders() => {
        'Content-type': 'application/json; charset=utf-8',
        'Accept': 'application/json ',
      };
}

Future postWithFiles(
  Map<String, String> data,
  List<File> files,
  String url,
) async {
  http.MultipartRequest multipartRequest =
      http.MultipartRequest("POST", Uri.parse(url));

  if (files.isNotEmpty) {
    for (File file in files) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('imgs[]', file.path);
      multipartRequest.files.add(multipartFile);
    }
  }

  multipartRequest.fields.addAll(data);

  try {
    http.StreamedResponse streamedResponse = await multipartRequest.send();
    http.Response response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 302) {
      return "success";
    } else {
      return "error";
    }
  } catch (e) {
    return "error";
  }
}
