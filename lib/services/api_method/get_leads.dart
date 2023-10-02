// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter_production_boilerplate/services/api_method/login.dart';

Future<void> getLeads(String sessionId) async {
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

void main() async {
  final userAuth = {
    'user_name': 'nv',
    'password': '7d790f9e30034b34eac3886d31848d28',
  };
  const appName = 'My SuiteCRM REST Client';
  final nameValueList = [];

  final loginResult = await login(
      'nv', '7d790f9e30034b34eac3886d31848d28', appName, nameValueList);
  final sessionId = loginResult['id'];

  await getLeads(sessionId);
}
