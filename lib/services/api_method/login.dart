import 'dart:convert';
import 'package:http/http.dart' as http;

const suiteCrmBaseUrl =
    'https://suitecrm8.longphatcrm.vn/service/v4_1/rest.php';

Future<Map<String, dynamic>> login(String username, String password,
    String appName, List nameValueList) async {
  final userAuth = {
    'user_name': username,
    'password': password,
  };

  final loginArgs = {
    'user_auth': userAuth,
    'application_name': appName,
    'name_value_list': nameValueList,
  };

  return await restRequest('login', loginArgs);
}

Future<Map<String, dynamic>> restRequest(
    String method, Map<String, dynamic> arguments) async {
  final response = await http.post(
    Uri.parse(suiteCrmBaseUrl),
    body: {
      "method": method,
      "input_type": "JSON",
      "response_type": "JSON",
      "rest_data": jsonEncode(arguments),
    },
  );

  if (response.statusCode != 200) {
    throw Exception(
        'Failed to make request to SuiteCRM REST API: ${response.statusCode}');
  }

  return jsonDecode(response.body);
}
