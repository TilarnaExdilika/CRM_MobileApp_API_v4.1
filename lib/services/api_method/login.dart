import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> loginToSuiteCRM() async {
  const String apiUrl = 'http://example.com/suitecrm/service/v4_1/rest.php';

  final userAuth = {
    'user_name': 'nv',
    'password': '7d790f9e30034b34eac3886d31848d28',
  };

  const appName = 'My SuiteCRM REST Client';
  final nameValueList = {};

  final args = {
    'user_auth': userAuth,
    'application_name': appName,
    'name_value_list': nameValueList,
  };

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(args),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final sessionId = jsonResponse['id'];

    final entryArgs = {
      'session': sessionId,
      'module_name': 'Accounts',
      'query': "accounts.billing_address_city = 'Ohio'",
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

    final entryResponse = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'method': 'get_entry_list',
        'input_type': 'JSON',
        'response_type': 'JSON',
        'rest_data': entryArgs
      }),
    );

    if (entryResponse.statusCode == 200) {
      final Map<String, dynamic> entryJsonResponse =
          json.decode(entryResponse.body);
      print(entryJsonResponse);
    } else {
      print(
          'Failed to retrieve entry list with status code: ${entryResponse.statusCode}');
    }
  } else {
    print('Login Failed with status code: ${response.statusCode}');
  }
}

void main() async {
  await loginToSuiteCRM();
}
