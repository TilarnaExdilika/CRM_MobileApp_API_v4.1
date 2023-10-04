import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate/services/api_method/create_lead.dart';
import 'package:flutter_production_boilerplate/services/api_method/login.dart';
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
  late TextEditingController _nameController;
  late TextEditingController _salutationController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _mobilePhoneController;
  late TextEditingController _accountNameController;
  late TextEditingController _accountDescriptionController;
  late TextEditingController _opportunityNameController;
  late TextEditingController _opportunityAmountController;

  late String _sessionId;

  final int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _salutationController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _mobilePhoneController = TextEditingController();
    _accountNameController = TextEditingController();
    _accountDescriptionController = TextEditingController();
    _opportunityNameController = TextEditingController();
    _opportunityAmountController = TextEditingController();

    _getSessionId();
  }

  Future<void> _getSessionId() async {
    final loginResult = await login(
      'dev_crmonline',
      '93c674bbea62adf2a5d70252e612cccd',
      'My SuiteCRM REST Client',
      [],
    );
    setState(() {
      _sessionId = loginResult['id'];
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _salutationController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobilePhoneController.dispose();
    _accountNameController.dispose();
    _accountDescriptionController.dispose();
    _opportunityNameController.dispose();
    _opportunityAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Header(
                  text: 'bottom_nav_second',
                  logoPath: 'assets/img/logo.png',
                ),
              ),
              const SizedBox(height: 16), // Khoảng cách giữa các trường nhập
              DynamicInputCard(
                label: tr('name'),
                controller: _nameController,
                onChanged: (newValue) {
                  // onChanged logic if needed
                },
              ),
              DynamicInputCard(
                label: tr('salutation'),
                controller: _salutationController,
                onChanged: (newValue) {
                  // onChanged logic if needed
                },
              ),
              DynamicInputCard(
                label: tr('first_name'),
                controller: _firstNameController,
                onChanged: (newValue) {
                  // onChanged logic if needed
                },
              ),
              DynamicInputCard(
                label: tr('last_name'),
                controller: _lastNameController,
                onChanged: (newValue) {
                  // onChanged logic if needed
                },
              ),
              DynamicInputCard(
                label: tr('phone_mobile'),
                controller: _mobilePhoneController,
                onChanged: (newValue) {
                  // onChanged logic if needed
                },
              ),
              DynamicInputCard(
                label: tr('account_name'),
                controller: _accountNameController,
                onChanged: (newValue) {
                  // onChanged logic if needed
                },
              ),
              DynamicInputCard(
                label: tr('account_description'),
                controller: _accountDescriptionController,
                onChanged: (newValue) {
                  // onChanged logic if needed
                },
              ),
              DynamicInputCard(
                label: tr('opportunity_name'),
                controller: _opportunityNameController,
                onChanged: (newValue) {
                  // onChanged logic if needed
                },
              ),
              DynamicInputCard(
                label: tr('opportunity_amount'),
                controller: _opportunityAmountController,
                onChanged: (newValue) {
                  // onChanged logic if needed
                },
              ),
              const SizedBox(
                  height: 24), // Khoảng cách giữa các trường nhập và nút Create
              ElevatedButton(
                onPressed: () async {
                  await _createNewLead();
                },
                child: const Text('Create'),
              ),
            ],
          ),
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

  Future<void> _createNewLead() async {
    // ignore: unnecessary_null_comparison
    if (_sessionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(tr('session_id_null_error')),
        ),
      );
      return;
    }
    try {
      final createLeadResult = await createLead(
        _sessionId,
        _nameController.text,
        _salutationController.text,
        _firstNameController.text,
        _lastNameController.text,
        _mobilePhoneController.text,
        _accountNameController.text,
        _accountDescriptionController.text,
        _opportunityNameController.text,
        int.parse(_opportunityAmountController.text),
      );

      if (createLeadResult['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(tr('lead_created_success')),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                tr('lead_created_failed') + ': ${createLeadResult['error']}'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(tr('lead_created_failed') + ': $e'),
        ),
      );
    }
  }
}
