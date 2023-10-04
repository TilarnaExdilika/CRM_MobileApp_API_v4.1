// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/services/api_method/get_leads.dart';
import 'package:flutter_production_boilerplate/services/api_method/login.dart';
import 'package:flutter_production_boilerplate/ui/screens/insert_screens.dart';
import 'package:flutter_production_boilerplate/ui/screens/search_srceen.dart';
import 'package:flutter_production_boilerplate/ui/widgets/custom_nav_bar.dart';
import 'package:flutter_production_boilerplate/ui/widgets/header.dart';
import 'package:flutter_production_boilerplate/ui/widgets/list_screen/list_card.dart';
import 'package:flutter_production_boilerplate/ui/widgets/unmated.dart';
import 'package:ionicons/ionicons.dart';

void main() => runApp(const MaterialApp(home: ListScreen()));

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

// ***************************

// ********************************

class _ListScreenState extends State<ListScreen> {
  int _currentIndex = 0;
  List<dynamic> leads = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // ignore: unused_local_variable
    final userAuth = {
      'user_name': 'dev_crmonline',
      'password': '93c674bbea62adf2a5d70252e612cccd',
    };
    const appName = 'My SuiteCRM REST Client';
    final nameValueList = [];

    final loginResult = await login('dev_crmonline',
        '93c674bbea62adf2a5d70252e612cccd', appName, nameValueList);
    final sessionId = loginResult['id'];

    List<dynamic> leadsResult = await getLeads(sessionId);

    setState(() {
      leads = leadsResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal:
                  16), // Khoảng cách này sẽ ảnh hưởng đến Header và ListCard
          child: Column(
            children: [
              // Header
              const Padding(
                padding: EdgeInsets.only(
                    top: 20), // Thêm khoảng cách cho Header ở trên cùng
                child: Header(
                  text: 'bottom_nav_second',
                  logoPath: 'assets/img/logo.png',
                ),
              ),
              // Danh sách ListCard sử dụng ListView.builder
              Expanded(
                child: IndexedStack(
                  index: _currentIndex,
                  children: [
                    // List Screen
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemCount: leads.length,
                      itemBuilder: (context, index) {
                        final lead = leads[index]['name_value_list'];
                        final leadName = lead['name']['value'];
                        final leadId = lead['id']['value'];

                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 2), // Thêm khoảng cách giữa các ListCard
                          child: ListCard(
                            title: leadName,
                            icon: Ionicons.logo_github,
                            url: '',
                            leadId: leadId,
                            leadName: leadName,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomCustomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            if (index == 3) {
              Navigator.pop(context);
            } else if (index == 1) {
              // Chuyển đến màn hình InsertScreen khi index là 1
              Navigator.pushReplacement(
                context,
                NoAnimationPageRoute(
                    builder: (context) => const InsertScreen()),
              );
            } else if (index == 2) {
              // Chuyển đến màn hình SearchScreen khi index là 2
              Navigator.pushReplacement(
                context,
                NoAnimationPageRoute(
                    builder: (context) => const SearchScreen()),
              );
            } else {
              _currentIndex = index;
            }
          });
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String leadId;
  final String leadName;

  const DetailScreen({Key? key, required this.leadId, required this.leadName})
      : super(key: key);

  Future<void> _deleteLead(BuildContext context, String leadId) async {
    // Get a valid session ID.
    final loginResult = await login('dev_crmonline',
        '93c674bbea62adf2a5d70252e612cccd', 'My SuiteCRM REST Client', []);
    final sessionId = loginResult['id'];

    // Create the delete_entry API call request.
    final deleteArgs = {
      'session': sessionId,
      'module_name': 'Leads',
      'name_value_list': [
        {'name': 'id', 'value': leadId}
      ],
    };

    // Make the delete_entry API call.
    final deleteResult = await restRequest('delete_entry', deleteArgs);

    // If the delete_entry API call was successful, the deleteResult['id'] property will contain the ID of the deleted lead.
    if (deleteResult['id'] != null) {
      // Xóa thành công.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Xóa lead thành công.'),
        ),
      );
    } else {
      // Xóa thất bại.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Xóa lead thất bại: ${deleteResult['name']}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID khách hàng: $leadId'),
            Text('Tên khách hàng: $leadName'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _deleteLead(context,
                        leadId); // Gọi hàm xóa lead khi nút Xóa được nhấn
                  },
                  child: const Text('Xóa'),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý logic khi nút Sửa được nhấn
                  },
                  child: const Text('Sửa'),
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý logic khi nút Sao chép được nhấn
                  },
                  child: const Text('Sao chép'),
                  style: ElevatedButton.styleFrom(
                    primary: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Trở về trang trước
                  },
                  child: const Text('Trở lại'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
