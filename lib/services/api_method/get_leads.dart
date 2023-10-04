// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter_production_boilerplate/services/api_method/login.dart';

Future<List<dynamic>> getLeads(String sessionId) async {
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
    'max_results': 40,
    'deleted': 0,
  };

  final entryListResult = await restRequest('get_entry_list', entryArgs);

  // Lấy danh sách leads từ kết quả API
  List<dynamic> leads = entryListResult['entry_list'];

  return leads;
}

Future<void> deleteLead(String sessionId, String leadId) async {
  final deleteArgs = {
    'session': sessionId,
    'module_name': 'Leads',
    'name_value_list': [
      {'name': 'id', 'value': leadId}
    ],
  };

  try {
    final deleteResult = await restRequest('delete_entry', deleteArgs);

    if (deleteResult['id'] == null) {
      // Xóa thất bại
      print('Failed to delete lead with ID $leadId: ${deleteResult['name']}');
    } else {
      // Xóa thành công
      print('Lead with ID $leadId deleted successfully.');
    }
  } catch (e) {
    // Xóa thất bại do lỗi mạng hoặc lỗi khác
    print('Failed to delete lead with ID $leadId: $e');
  }
}

void main() async {
  final userAuth = {
    'user_name': 'dev_crmonline',
    'password': '93c674bbea62adf2a5d70252e612cccd',
  };
  const appName = 'My SuiteCRM REST Client';
  final nameValueList = [];

  final loginResult = await login('dev_crmonline',
      '93c674bbea62adf2a5d70252e612cccd', appName, nameValueList);
  final sessionId = loginResult['id'];

  await getLeads(sessionId);
}
