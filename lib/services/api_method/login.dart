import 'dart:convert';
import 'package:http/http.dart' as http;

const suiteCrmBaseUrl =
    'https://suitecrm8.longphatcrm.vn/service/v4_1/rest.php';

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

Future<void> main() async {
  final userAuth = {
    'user_name': 'nv',
    'password': '7d790f9e30034b34eac3886d31848d28',
  };
  const appName = 'My SuiteCRM REST Client';
  final nameValueList = [];

  final loginArgs = {
    'user_auth': userAuth,
    'application_name': appName,
    'name_value_list': nameValueList,
  };

  final loginResult = await restRequest('login', loginArgs);
  final sessionId = loginResult['id'];

  final entryArgs = {
    'session': sessionId,
    'module_name': 'Leads',
    'query': "",
    'order_by': '',
    'offset': 0,
    'select_fields': ['id', 'name'],
    'link_name_to_fields_array': [
      {
        'name': 'contacts',
        'value': ['first_name', 'last_name']
      }
    ],
    'max_results': 10,
    'deleted': 0,
  };

  final entryListResult = await restRequest('get_entry_list', entryArgs);
  print(entryListResult);
}
