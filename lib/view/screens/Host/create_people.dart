// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_attendence/config/constants/assetspath.dart';
// import 'package:qr_attendence/provider/create_people_provider.dart';

// class PeopleScreen extends StatefulWidget {
//   @override
//   State<PeopleScreen> createState() => _PeopleScreenState();
// }

// class _PeopleScreenState extends State<PeopleScreen> {
// // 
//   void _showAddPersonDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String id = '';
//         String name = '';

//         return AlertDialog(
//           title: Text('Add Person'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Image.asset(AssetPaths.addPeople),
//               TextField(
//                 decoration: InputDecoration(labelText: 'ID'),
//                 onChanged: (value) {
//                   id = value;
//                 },
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//               TextField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 onChanged: (value) {
//                   name = value;
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             ElevatedButton(
//               child: Text('Create'),
//               onPressed: () {
//                 if (id.isNotEmpty && name.isNotEmpty) {
//                   Provider.of<PeopleProvider>(context, listen: false)
//                       .addPerson(id, name);
//                   Navigator.of(context).pop();
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: (){
//           Navigator.pop(context);
//         }, icon: Icon(Icons.arrow_back)),
//         title: Text('Created People'),
//       ),
//       body: Consumer<PeopleProvider>(
//         builder: (context, peopleProvider, child) {
//           return ListView.builder(
//             itemCount: peopleProvider.people.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(peopleProvider.people[index]['name']!),
                
//                 subtitle: Text('ID: ${peopleProvider.people[index]['id']}'),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _showAddPersonDialog(context),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }