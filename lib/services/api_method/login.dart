import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String id;
  final String moduleName;
  final String userId;
  final String userName;
  final String userLanguage;
  final bool userIsAdmin;
  final String userDefaultDateFormat;
  final String userDefaultTimeFormat;
  final String userNumberSeparator;
  final String userDecimalSeparator;
  final String userCurrencyName;

  User({
    required this.id,
    required this.moduleName,
    required this.userId,
    required this.userName,
    required this.userLanguage,
    required this.userIsAdmin,
    required this.userDefaultDateFormat,
    required this.userDefaultTimeFormat,
    required this.userNumberSeparator,
    required this.userDecimalSeparator,
    required this.userCurrencyName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final nameValueList = json['name_value_list'];
    return User(
      id: json['id'],
      moduleName: json['module_name'],
      userId: nameValueList['user_id']['value'],
      userName: nameValueList['user_name']['value'],
      userLanguage: nameValueList['user_language']['value'],
      userIsAdmin: nameValueList['user_is_admin']['value'],
      userDefaultDateFormat: nameValueList['user_default_dateformat']['value'],
      userDefaultTimeFormat: nameValueList['user_default_timeformat']['value'],
      userNumberSeparator: nameValueList['user_number_seperator']['value'],
      userDecimalSeparator: nameValueList['user_decimal_seperator']['value'],
      userCurrencyName: nameValueList['user_currency_name']['value'],
    );
  }
}

Future<void> loginToSuiteCRM() async {
  final String apiUrl =
      'https://suitecrm8.longphatcrm.vn/service/v4_1/rest.php';
  final Map<String, dynamic> requestData = {
    "user_auth": {
      "user_name": "nv",
      "password": "7d790f9e30034b34eac3886d31848d28"
    },
    "application_name": "TEST API",
    "name_value_list": [],
    "deleted": "0"
  };

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    print('Login Successful:');
    final Map<String, dynamic> jsonBody = json.decode(response.body);
    final user = User.fromJson(jsonBody);
    print('User ID: ${user.userId}');
    // In ra các thuộc tính khác của user tại đây...
  } else {
    print('Login Failed with status code: ${response.statusCode}');
  }
}

void main() async {
  await loginToSuiteCRM();
}
