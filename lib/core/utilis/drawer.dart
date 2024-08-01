import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/provider/company/general_provider.dart';

class CompanyDrawerWidget extends StatefulWidget {
  const CompanyDrawerWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  State<CompanyDrawerWidget> createState() => _CompanyDrawerWidgetState();
}

class _CompanyDrawerWidgetState extends State<CompanyDrawerWidget> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFFFF0000)),
              title: const Text(
                'Logout',
              ),
              onTap: () async {
                final provider = Provider.of<GeneralProvider>(context, listen: false);
                try {
                  await provider.logout(context);

                  // Clear user session data
                  await SessionHandlingViewModel().removeCompanyToken();

                  // Navigate to the login screen
                  Navigator.pushReplacementNamed(context, RoutesName.signin);
                } catch (e) {
                  print('Logout error: $e');
                  Utils.toastMessage('Logout error: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
