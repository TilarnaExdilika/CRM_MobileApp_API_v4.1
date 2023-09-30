import 'package:http/http.dart' as http;

Future<void> main() async {
  final Map<String, dynamic> loginData = {
    "user_auth": {
      "user_name": "nv",
      "password": "7d790f9e30034b34eac3886d31848d28"
    },
    "application_name": "TEST API",
    "name_value_list": [],
    "deleted": "0"
  };

  final response = await http.post(
    Uri.parse('https://suitecrm8.longphatcrm.vn/service/v4_1/rest.php'),
    // body: json.encode(loginData),
  );

  if (response.statusCode == 200) {
    // final responseData = json.decode(response.body);
    print('Login Response: ${response.body}');
  } else {
    print('Login Failed with status code: ${response.statusCode}');
  }
}
