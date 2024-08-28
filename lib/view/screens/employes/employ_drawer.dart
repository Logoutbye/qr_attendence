import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/core/utilis/utils.dart';

class EmployeDrawerWidget extends StatefulWidget {
  const EmployeDrawerWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  State<EmployeDrawerWidget> createState() => _EmployeDrawerWidgetState();
}

class _EmployeDrawerWidgetState extends State<EmployeDrawerWidget> {
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
              title: const Text('Logout'),
              onTap: () async {
                try {
                  // Create an instance of SessionHandlingViewModel
                  SessionHandlingViewModel sessionHandling =
                      SessionHandlingViewModel();

                  // Remove company token
                  await sessionHandling.removeEmploySignedInToken();
                  await sessionHandling.removeEmployee();
                  final token =await sessionHandling.getemploySignedInToken();
                  print(":::: the token in drawer is :$token");
                  if (token == null) {
                    Utils.toastMessage("Employe Logout successfully");

                    // Navigate to the sign-in screen
                    Navigator.pushReplacementNamed(context, RoutesName.signin);
                  } else {
                    // Token is still there, show a message or handle accordingly
                    Utils.toastMessage("Logout failed. Please try again.");
                  }

                  // Show success message
                } catch (e) {
                  // Handle any errors
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
