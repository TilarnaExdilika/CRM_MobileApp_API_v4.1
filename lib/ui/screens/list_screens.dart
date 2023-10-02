import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/services/api_method/get_leads.dart';
import 'package:flutter_production_boilerplate/services/api_method/login.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<dynamic> leads = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final userAuth = {
      'user_name': 'nv',
      'password': '7d790f9e30034b34eac3886d31848d28',
    };
    const appName = 'My SuiteCRM REST Client';
    final nameValueList = [];

    final loginResult = await login(
        'nv', '7d790f9e30034b34eac3886d31848d28', appName, nameValueList);
    final sessionId = loginResult['id'];

    // Gọi hàm getLeads để lấy danh sách leads từ API
    List<dynamic> leadsResult = await getLeads(sessionId);

    setState(() {
      leads = leadsResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Leads'),
      ),
      body: ListView.builder(
        itemCount: leads.length,
        itemBuilder: (context, index) {
          final leadName = leads[index]['name_value_list']['name']['value'];

          return ListTile(
            title: Text(leadName),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ListScreen()));
