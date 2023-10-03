import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/services/api_method/get_leads.dart';
import 'package:flutter_production_boilerplate/services/api_method/login.dart';
import 'package:flutter_production_boilerplate/ui/screens/first_screen.dart';
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
        // ignore: deprecated_member_use
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstScreen()),
              );
            } else if (index == 1) {
              // Chuyển đến màn hình InsertScreen khi index là 1
              Navigator.push(
                context,
                NoAnimationPageRoute(
                    builder: (context) => const InsertScreen()),
              );
            } else if (index == 2) {
              // Chuyển đến màn hình SearchScreen khi index là 2
              Navigator.push(
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

  const DetailScreen({Key? key, required this.leadId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sử dụng giá trị leadId để hiển thị thông tin tương ứng trong DetailScreen
    return Scaffold(
      body: Center(
        child: Text('id khách hàng: $leadId'),
      ),
    );
  }
}
