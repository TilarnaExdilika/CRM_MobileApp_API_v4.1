import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> loginAndFetchLeads() async {
  const String apiUrl = 'http://example.com/suitecrm/service/v4_1/rest.php';

  final loginData = {
    'user_auth': {
      'user_name': 'nv',
      'password': '7d790f9e30034b34eac3886d31848d28',
    },
    'application_name': 'TEST API',
    'name_value_list': [],
    'deleted': '0',
  };

  final loginResponse = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'method': 'login',
      'input_type': 'JSON',
      'response_type': 'JSON',
      'rest_data': loginData,
    }),
  );

  if (loginResponse.statusCode == 200) {
    final Map<String, dynamic> loginJsonResponse =
        json.decode(loginResponse.body);
    final String sessionId = loginJsonResponse['id'];

    final entryListRequest = {
      'session': sessionId,
      'module_name': 'Leads',
      'query': '',
      'link_name_to_fields_array': [],
      'order_by': '',
      'offset': 0,
      'select_fields': ['id', 'name'],
      'max_results': 10,
      'deleted': 0,
    };

    final entryListResponse = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'method': 'get_entry_list',
        'input_type': 'JSON',
        'response_type': 'JSON',
        'rest_data': entryListRequest,
      }),
    );

    if (entryListResponse.statusCode == 200) {
      final Map<String, dynamic> entryListJsonResponse =
          json.decode(entryListResponse.body);
      print(entryListJsonResponse);
    } else {
      print(
          'Failed to retrieve entry list with status code: ${entryListResponse.statusCode}');
    }
  } else {
    print('Login Failed with status code: ${loginResponse.statusCode}');
  }
}

void main() async {
  await loginAndFetchLeads();
}
