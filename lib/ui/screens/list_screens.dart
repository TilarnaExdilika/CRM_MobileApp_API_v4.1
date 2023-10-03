import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/services/api_method/get_leads.dart';
import 'package:flutter_production_boilerplate/services/api_method/login.dart';
import 'package:flutter_production_boilerplate/ui/widgets/header.dart';
import 'package:flutter_production_boilerplate/ui/widgets/list_screen/list_card.dart';
import 'package:ionicons/ionicons.dart';

void main() => runApp(const MaterialApp(home: ListScreen()));

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

// ***************************

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 2, right: 8, left: 8),
      elevation: 4,
      // ignore: deprecated_member_use
      color: Theme.of(context).bottomAppBarColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: Theme.of(context).primaryColor,
        // ignore: deprecated_member_use
        unselectedItemColor: Theme.of(context).textTheme.bodyText1!.color,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.list_outline),
            label: tr('list_data'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.add_outline),
            label: tr('list_insert'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.trash_bin_outline),
            label: tr('list_delete'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Ionicons.play_back_outline),
            label: tr('list_back'),
          ),
        ],
      ),
    );
  }
}

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

                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 2), // Thêm khoảng cách giữa các ListCard
                          child: ListCard(
                            title: leadName,
                            icon: Ionicons.logo_github,
                            url: '',
                          ),
                        );
                      },
                    ),
                    const InsertScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            if (index == 3) {
              Navigator.of(context).pop();
            } else if (index == 1) {
              _currentIndex = 1;
            } else {
              _currentIndex = index;
            }
          });
        },
      ),
    );
  }
}

class InsertScreen extends StatelessWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Insert Screen Content'),
      ),
    );
  }
}
