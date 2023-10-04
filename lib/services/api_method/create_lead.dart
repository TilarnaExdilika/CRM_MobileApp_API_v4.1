// import 'package:flutter_production_boilerplate/services/api_method/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const suiteCrmBaseUrl =
    'https://suitecrm8.longphatcrm.vn/service/v4_1/rest.php';

Future<Map<String, dynamic>> createLead(
  String sessionId,
  String leadName,
  String salutation,
  String firstName,
  String lastName,
  String phoneMobile,
  String accountName,
  String accountDescription,
  String opportunityName,
  int opportunityAmount,
) async {
  final leadData = {
    'session': sessionId,
    'module_name': 'Leads',
    'name_value_list': {
      'name': leadName,
      'salutation': salutation,
      'first_name': firstName,
      'last_name': lastName,
      'phone_mobile': phoneMobile,
      'account_name': accountName,
      'account_description': accountDescription,
      'opportunity_name': opportunityName,
      'opportunity_amount': opportunityAmount.toString(),
    },
  };

  final response = await restRequest('set_entry', leadData);

  return response;
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
