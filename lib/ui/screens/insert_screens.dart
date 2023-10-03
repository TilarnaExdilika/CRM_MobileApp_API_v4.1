import 'package:easy_localization/easy_localization.dart';
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
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController salutationController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController mobilePhoneController;
  late TextEditingController accountNameController;
  late TextEditingController accountDescriptionController;
  late TextEditingController opportunityNameController;

  final int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: "");
    descriptionController = TextEditingController(text: "");
    salutationController = TextEditingController(text: "");
    firstNameController = TextEditingController(text: "");
    lastNameController = TextEditingController(text: "");
    mobilePhoneController = TextEditingController(text: "");
    accountNameController = TextEditingController(text: "");
    accountDescriptionController = TextEditingController(text: "");
    opportunityNameController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    salutationController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobilePhoneController.dispose();
    accountNameController.dispose();
    accountDescriptionController.dispose();
    opportunityNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ignore: deprecated_member_use
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
            DynamicInputCard(
              label: tr('name'),
              controller: nameController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            DynamicInputCard(
              label: tr('description'),
              controller: descriptionController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            DynamicInputCard(
              label: tr('salutation'),
              controller: salutationController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            DynamicInputCard(
              label: tr('first_name'),
              controller: firstNameController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            DynamicInputCard(
              label: tr('last_name'),
              controller: lastNameController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            DynamicInputCard(
              label: tr('phone_mobile'),
              controller: mobilePhoneController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            DynamicInputCard(
              label: tr('account_name'),
              controller: accountNameController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            DynamicInputCard(
              label: tr('account_description'),
              controller: accountDescriptionController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            DynamicInputCard(
              label: tr('opportunity_name'),
              controller: opportunityNameController,
              onChanged: (newValue) {
                // onChanged logic if needed
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Kiểm tra xem các giá trị có hợp lệ hay không (nếu cần)
                // Gửi các giá trị lên API để tạo leads mới
                createNewLead();
              },
              child: Text(tr('create')),
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

  void createNewLead() {
    // Lấy giá trị từ các controllers để tạo đối tượng JSON hoặc thực hiện các hành động khác tùy thuộc vào yêu cầu của bạn.
  }
}
