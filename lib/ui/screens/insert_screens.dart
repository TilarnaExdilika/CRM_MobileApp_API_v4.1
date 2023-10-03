import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/ui/screens/list_screens.dart';
import 'package:flutter_production_boilerplate/ui/screens/search_srceen.dart';
import 'package:flutter_production_boilerplate/ui/widgets/custom_nav_bar.dart';
import 'package:flutter_production_boilerplate/ui/widgets/header.dart';
import 'package:flutter_production_boilerplate/ui/widgets/list_screen/input_card.dart';
import 'package:flutter_production_boilerplate/ui/widgets/unmated.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  _InsertScreenState createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  final int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController(text: "");
    nameController = TextEditingController(text: "");
    phoneNumberController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Header(
                text: 'bottom_nav_second',
                logoPath: 'assets/img/logo.png',
              ),
            ),
            // Tạo danh sách các DynamicInputCard dựa trên nhu cầu
            DynamicInputCard(
              label: 'ID',
              controller: idController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            DynamicInputCard(
              label: 'Name',
              controller: nameController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            DynamicInputCard(
              label: 'Phone Number',
              controller: phoneNumberController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            // Nút "Create" để tạo leads mới
            ElevatedButton(
              onPressed: () {
                // Kiểm tra xem các giá trị có hợp lệ hay không (nếu cần)
                // Gửi các giá trị lên API để tạo leads mới
                createNewLead();
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomCustomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 3) {
            Navigator.pop(context);
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              NoAnimationPageRoute(builder: (context) => const SearchScreen()),
            );
          } else if (index == 0) {
            Navigator.pushReplacement(
              context,
              NoAnimationPageRoute(builder: (context) => const ListScreen()),
            );
          }
        },
      ),
    );
  }

  void createNewLead() {}
}
