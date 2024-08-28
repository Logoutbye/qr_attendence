// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_attendence/config/routes/routes_name.dart';
// import 'package:qr_attendence/core/components/session_handling.dart';
// import 'package:qr_attendence/core/utilis/utils.dart';
// import 'package:qr_attendence/provider/company/general_provider.dart';

// class CompanyDrawerWidget extends StatefulWidget {
//   const CompanyDrawerWidget({
//     super.key,
//     required this.height,
//   });

//   final double height;

//   @override
//   State<CompanyDrawerWidget> createState() => _CompanyDrawerWidgetState();
// }

// class _CompanyDrawerWidgetState extends State<CompanyDrawerWidget> {
//   bool isLogin = true;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Drawer(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Color(0xFFFF0000)),
//               title: const Text(
//                 'Logout',
//               ),
//               onTap: () async {
//                 try {
//                   await SessionHandlingViewModel()
//                       .removeCompanyToken()
//                       .then((value) {
//                     Navigator.pushReplacementNamed(context, RoutesName.signin)
//                         .then((value) {
//                       Utils.toastMessage("Logout sucessfully");
//                     });
//                   });

//                   // Clear user session data

//                   // Navigate to the login screen
//                 } catch (e) {
//                   print('Logout error: $e');
//                   Utils.toastMessage('Logout error: $e');
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/config/routes/routes_name.dart';
import 'package:qr_attendence/core/components/session_handling.dart';
import 'package:qr_attendence/core/utilis/utils.dart';
import 'package:qr_attendence/view/common/settheme.dart';

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
  Future<void> handleLogout() async {
    try {
      final sessionHandling = SessionHandlingViewModel();

      // Remove the company token
      await sessionHandling.removeCompanyToken();
      await sessionHandling.removecompany();

      // Retrieve token to confirm removal
      final token = await sessionHandling.getCompanyToken();

      // Check if token is null (meaning it was removed successfully)
      if (token == null) {
        // Token removed successfully, navigate to sign-in screen
        Utils.toastMessage("Logout successfully");
        Navigator.of(context).pushReplacementNamed(RoutesName.signin);
      } else {
        // Token is still there, show a message or handle accordingly
        Utils.toastMessage("Logout failed. Please try again.");
      }
    } catch (e) {
      // Handle any errors
      print('Logout error: $e');
      Utils.toastMessage('Logout error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Themeset(), // Replace with your SigninScreen widget
          ),
        );
                },
                child: Row(
                  children: [
                    Icon(Icons.light_mode_outlined),
                    SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                    Text('change theme',style: Theme.of(context).textTheme.bodyMedium,)
                  ],
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFFFF0000)),
              title: const Text('Logout'),
              onTap: handleLogout,
            ),
          ],
        ),
      ),
    );
  }
}
